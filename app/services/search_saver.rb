module SearchSaver
  def self.save_search(query, user_ip, articles)
    return unless query.present?

    search = Search.new(text_query: query, user_ip: user_ip)

    articles.each do |article|
      search.article = article
      search.save
    end
  end
end
