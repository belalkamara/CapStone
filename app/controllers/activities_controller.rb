class ActivitiesController < ApplicationController
  def index
    @activity_events = Activity.all
  end

  def new
    @activity_events = Activity.new
  end

  def create
    @activity_events = Activity.new(params.require(:activity).permit(:title, :miles, :image))

    respond_to do |format|
      if @activity_events.save
        format.html { redirect_to activities_path, notice: 'Your event was successfully created.' }
        format.json { render :show, status: :created, location: @activity_events }
      else
        format.html { render :new }
        format.json { render json: @activity_events.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @activity_events = Activity.find(params[:id])
  end

  def update
    @activity_events = Activity.find(params[:id])

    respond_to do |format|
      if @activity_events.update(params.require(:activity).permit(:title, :miles, :image))
        format.html { redirect_to activities_path, notice: 'Your activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_events }
      else
        format.html { render :edit }
        format.json { render json: @activity_events.errors, status: :unprocessable_entity }
      end
    end
  end
end
