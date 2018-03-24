class ActivitiesController < ApplicationController
  def index
    @activity_events = Activity.all
  end
end
