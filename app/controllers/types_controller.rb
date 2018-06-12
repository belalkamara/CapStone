class TypesController < ApplicationController
  layout "activity"
  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])

    if logged_in?(:site_admin)
      @activity_events = @type.activities.recent.page(params[:page]).per(9).by_position
    else
      @activity_events = @type.activities.live.recent.page(params[:page]).per(9).by_position
    end
  end
end
