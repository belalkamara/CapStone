class UserDashboardController < ApplicationController

  def index
    @user_draft_blogs = Blog.draft.blogs_by current_user

    @user_published_blogs = Blog.published.blogs_by current_user

    @draft_activities = Activity.draft.activities_by current_user   

    @ended_activities = Activity.ended.activities_by current_user  

    @live_activities = Activity.live.activities_by current_user 

    # @user_miles = User.miles
  end

  def profile
    
  end

  def active_activities
    
  end
end