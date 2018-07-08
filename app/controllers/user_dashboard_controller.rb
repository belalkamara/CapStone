class UserDashboardController < ApplicationController
  layout "user_dashboard"

  def index
    @draft_blogs = Blog.draft.blogs_by current_user

    @pub_blogs = Blog.published.blogs_by current_user

    @draft_acts = Activity.draft.activities_by current_user   

    @ended_acts = Activity.ended.activities_by current_user  

    @live_acts = Activity.live.activities_by current_user
  end

  def sort
     
  end

  def profile
    
  end

  def active_activities
    @live_activities = Activity.live.by_position.activities_by current_user
  end

  private

  def user_params
      params.require(:user).permit(:email, :name, :miles, :day)
   end

  def set_user_miles
    @user_miles = User.find(params[:id])
  end
end