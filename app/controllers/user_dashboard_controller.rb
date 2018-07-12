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

  def active_activities
    @user_logs = UserLog.new

    @user_log = UserLog.all.page(params[:page]).per(6).user_log_by current_user
  end

end