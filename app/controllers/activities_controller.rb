class ActivitiesController < ApplicationController
  before_action :set_activity_item, only: [:edit, :update, :destroy, :show]
  before_action :set_sidebar_types, except: [:update, :create, :destroy]

  require 'date'
  layout "activity"
  # access all: [:show, :index], user: {except: [:destroy, :edit]}, site_admin: :all
  
  def index
    if logged_in?(:site_admin)
      @activity_events = Activity.recent.page(params[:page]).per(9).by_position
    else
      @activity_events = Activity.all_except(Activity.ended).recent.page(params[:page]).per(9).by_position
    end
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
    if logged_in?(:user) && current_user.try(:name) != "Guest User"
      @activity_events = current_user.activities.new
    else
      redirect_to root_path, notice: "You are not authorized to access this page"
    end
  end

  def create
    @activity_events = current_user.activities.new(activity_params)

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
    authorize @activity_events
  end

  def update
    authorize @activity_events

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
    @activity_events = Activity.includes(:act_joins).find(params[:id])
    @act_join = ActJoin.new
    
    @page_title = @activity_events.title

    @user_activities = Activity.activities_by current_user
  end

  def destroy
    authorize @activity_events
    
    @activity_events.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully Deleted.' }
      format.json { head :no_content }
    end
  end 


  private

  def activity_params
    params.require(:activity).permit(:title, 
                                     :description, 
                                     :miles, 
                                     :image,
                                     :status,
                                     :end_date,
                                     :start_date,
                                     :user_id,
                                     :type_id
                                     )
  end

  def set_activity_item
    @activity_events = Activity.find(params[:id])
  end

  def set_sidebar_types
    @sidebar_types  = Type.with_activities
  end

end
