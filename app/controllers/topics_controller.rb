class TopicsController < ApplicationController
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(7)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(7)
    end
  end
end

