class PagesController < ApplicationController
  def home
    @posts = Blog.all
  end

  def about
  end

  def contact
  end

  def ranking
    @activity_events = Activity.all
  end
end
