class UserLogsController < ApplicationController
  def index
    @user_logs = UserLog.all
  end

  def new
    @user_logs = UserLog.new
  end

  def create
    @user_logs = current_user.user_logs.new(user_log_params)

    respond_to do |format|
      if @user_logs.save!
        format.html { redirect_to user_dashboard_path, notice: 'Your entry has been saved.' }
        format.json { render :show, status: :created, location: @user_logs }
      else
        format.html { render :new }
        format.json { render json: @user_logs.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_log_params
    params.require(:user_logs).permit(:user_id, :miles, :day)
  end
end
