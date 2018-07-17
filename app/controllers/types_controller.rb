class TypesController < ApplicationController
  before_action :set_sidebar_types
  layout "activity"
  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])

    if logged_in?(:site_admin)
      @activity_events = @type.activities.recent.page(params[:page]).per(9).by_position
    else
      @activity_events = @type.activities.live.recent.page(params[:page]).per(9).by_position || @activity_events = @type.activities.draft.recent.page(params[:page]).per(9).by_position
    end
  end

  private

  def set_sidebar_types
    @sidebar_types  = Type.with_activities
  end
end
