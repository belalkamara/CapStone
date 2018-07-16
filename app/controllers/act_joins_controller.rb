class ActJoinsController < ApplicationController
  def index
    @act_joins = ActJoin.all
  end

  def new
    @act_joins = ActJoin.new
  end

  def create
    @act_joins = current_user.act_joins.new(act_join_params)

    respond_to do |format|
      if @act_joins.save!
        format.html { redirect_to '/activities', notice: 'You successfully joined the event.' }
        format.json { render :show, status: :created, location: @act_joins }
      else
        format.html { render :new }
        format.json { render json: @act_joins.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def act_join_params
    params.require(:act_joins).permit(:user_id, :activity_id)
  end
end

