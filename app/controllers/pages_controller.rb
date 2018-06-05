class PagesController < ApplicationController
  def home
    @posts = Blog.all
  end

  def about
  end

  def ranking
    @activity_events = Activity.all
  end

  def user_dashboard
    
  end

  def tweets
    @tweets = SocialTool.twitter_search
  end
end
