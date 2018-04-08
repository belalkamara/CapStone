class ActivitiesController < ApplicationController
  
  def index
    @activity_events = Activity.all
  end

  def draft
    @draft_events = Activity.draft
  end

  def new
    @activity_events = Activity.new
  end

  def create
    @activity_events = Activity.new(params.require(:activity).permit(:title, :miles, :image, :days))

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
      if @activity_events.update(params.require(:activity).permit(:title, :miles, :image, :days, :status))
        format.html { redirect_to activities_path, notice: 'Your activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_events }
      else
        format.html { render :edit }
        format.json { render json: @activity_events.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @activity_events = Activity.find(params[:id])
  end

  def destroy
    @activity_events = Activity.find(params[:id])

    @activity_events.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully Deleted.' }
      format.json { head :no_content }
    end
  end 

  def toggle_status
    @activity_events = Activity.find(params[:id])

    if @activity_events.draft?
      @activity_events.live!
    elsif @activity_events.live?
      @activity_events.draft!
    end

    if @activity_events.days.nil? || @activity_events.days == 0
      @activity_events.ended!
    end
      
    redirect_to activities_url, notice: "Your activity status has been updated."
  end
end
