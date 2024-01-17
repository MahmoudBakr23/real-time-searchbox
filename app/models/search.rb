class Search < ApplicationRecord
  belongs_to :article, optional: true

  private

  # Analysing the search queries and take the most 3 trending articles based on what
  # all users searches, the more the saved queries related to the article, the more
  # likely that this article will become on top of the trending view.
  def self.trending
    trending_queries = group(:text_query).order("count_all DESC").limit(3).count.keys
    pattern = trending_queries.map { |query| "title ILIKE ?" }.join(" OR ")
    pattern_values = trending_queries.map { |query| "%#{query}%" }

    Article
      .select("articles.*, COUNT(searches.id) AS text_query_count")
      .joins(:searches)
      .where(pattern, *pattern_values)
      .group("articles.id")
      .order("text_query_count DESC")
      .limit(3)
  end

  # Analysing the single user's queries to be able to recommend for them articles
  # based on what they usually search for using their recent saved queries by their IP address.
  def self.recommendations(ip)
    user_queries = where(user_ip: ip).order(created_at: :desc).pluck(:text_query).first(5)
    pattern = user_queries.map { |query| "title ILIKE ?" }.join(" OR ")
    pattern_values = user_queries.map { |query| "%#{query}%" }

    Article.where(pattern, *pattern_values).limit(5)
  end

  # Returning the 3 most recent published articles in case trending list is empty.
  def self.displaying_trends
    if self.trending.empty?
      Article.order(created_at: :desc).limit(3)
    else
      self.trending
    end
  end
end
