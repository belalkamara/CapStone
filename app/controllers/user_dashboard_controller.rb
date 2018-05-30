class UserDashboardController < ApplicationController

  def index
    @user_draft_blogs = Blog.draft.blogs_by current_user

    @user_published_blogs = Blog.published.blogs_by current_user

    @draft_activities = Activity.draft.activities_by current_user   

    @ended_activities = Activity.ended.activities_by current_user  

    @live_activities = Activity.live.activities_by current_user
  end

  def sort
    
  end

  # def edit
    
  # end

  # def update
  #   @user_miles = User.find(params[:id])

  #   respond_to do |format|
  #     if @user_miles.update_attributes(params[:miles])
  #       redirect_to "/user-dashboard"
  #     else
  #       render "edit"
  #     end
  #   end
  # end

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