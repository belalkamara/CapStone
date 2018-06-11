class ActivitiesController < ApplicationController
  before_action :set_activity_item, only: [:edit, :update, :destroy, :show, :toggle_status]
  require 'date'
  layout "activity"
  # access all: [:show, :index], user: {except: [:destroy, :edit]}, site_admin: :all
  
  def index
    @activity_events = Activity.page(params[:page]).per(9).by_position
  end

  def sort
    params[:order].each do |key, value|
      Activity.find(value[:id]).update(position: value[:position])
    end

    render nothing: :true
  end

  def draft
    @draft_events = Activity.draft
  end

  def new
    @activity_events = Activity.new
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
  end

  def update
    @activity_events.event_to_days

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
    @page_title = @activity_events.title

    @user_activities = Activity.activities_by current_user
  end

  def destroy
    @activity_events.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully Deleted.' }
      format.json { head :no_content }
    end
  end 

  def toggle_status
    if @activity_events.draft?
      @activity_events.live!
    else @activity_events.live?
      @activity_events.draft!
    end

    if @activity_events.days.nil? || @activity_events.days == 0
      @activity_events.ended!
    end
      
    redirect_to activities_url, notice: "Your activity status has been updated."
  end


  def join_event
  end

  private

  def activity_params
    params.require(:activity).permit(:title, 
                                     :description, 
                                     :miles, 
                                     :image, 
                                     :days,
                                     :end_date,
                                     :start_date, 
                                     :user_id,
                                     :type_id
                                     )
  end

  def set_activity_item
    @activity_events = Activity.find(params[:id])
  end
end
