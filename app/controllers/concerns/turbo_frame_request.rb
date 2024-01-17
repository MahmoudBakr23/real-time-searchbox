module TurboFrameRequest
  extend ActiveSupport::Concern

  def render_response_for_turbo_frame(articles)
    if turbo_frame_request?
      render partial: "articles", locals: { articles: articles }
    else
      render :index
    end
  end
end
