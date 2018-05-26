class UserDashboardController < ApplicationController

  def index
    @user_draft_blogs = Blog.draft.blogs_by current_user

    @user_published_blogs = Blog.published.blogs_by current_user

    # @user_miles = User.miles
  end

  def profile
    
  end

  def active_activities
    
  end
end