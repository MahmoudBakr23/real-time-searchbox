class ArticlesController < ApplicationController
  include SearchSaver
  include TurboFrameRequest
  before_action :set_article, only: %i[ show ]

  def index
    if params[:query].present?
      @articles = Article.where("title ILIKE ?", "%#{params[:query]}%")

      # Check if the query is complete before saving it
      SearchSaver.save_search(params[:query], request.remote_ip, @articles) if params[:complete_query] == 'true'
    else
      @articles = Article.all
    end

    # Trending articles instance
    @trending_articles = Search.displaying_trends

    # User recommendations instance
    @recommendations = Search.recommendations(request.remote_ip)

    # Turbo frame request rendering
    render_response_for_turbo_frame(@articles)
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
