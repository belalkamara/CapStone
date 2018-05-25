class UserDashboardController < ApplicationController

  def index
    @user_blogs = Blog.page(params[:page]).per(7).blogs_by current_user

    @user_draft_blogs = Blog.draft.blogs_by current_user

    @user_published_blogs = Blog.published.blogs_by current_user
  end

  def profile
    
  end

  def active_activities
    
  end
end