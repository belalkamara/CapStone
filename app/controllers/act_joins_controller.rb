class ActJoinsController < ApplicationController
  def create
    @act_join = current_user.act_joins.build(act_join_params)
  end

  private

  def act_join_params
    params.require(:act_join).permit(:user_id, :activity_id)
  end
end
