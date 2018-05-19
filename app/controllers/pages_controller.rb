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
end
