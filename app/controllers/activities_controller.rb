class ActivitiesController < ApplicationController
  require 'date'
  
  def index
    @activity_events = Activity.all
  end

  def draft
    @draft_events = Activity.draft
  end

  def new
    @activity_events = Activity.new
    1.times { @activity_events.types.build }
  end

  def create
    @activity_events = Activity.new(activity_params)

    respond_to do |format|
      if @activity_events.save!
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
      if @activity_events.update(activity_params)
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
    @page_title = @activity_events.title
    @event_days = @activity_events.event_days
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

  # def event_days
  #   Integer(Date.new(self.end_date) - (closer_to_end_date))
  # end

  # def closer_to_end_date
  #   if Date.today >= Date.new(self.start_date)
  #     Date.today
  #   elsif Date.new(self.start_date) >= Date.today
  #     Date.new(self.start_date)
  #   end
  # end

  

  private

  def activity_params
    params.require(:activity).permit(:title, 
                                     :description, 
                                     :miles, 
                                     :image, 
                                     :days,
                                     :end_date,
                                     :start_date, 
                                     types_attributes: [:name]
                                     )
  end
end
