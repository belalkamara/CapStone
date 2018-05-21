class UserDashboardController < ApplicationController

  def index
    @user_blogs = Blog.page(params[:page]).per(7).blogs_by current_user
  end

end