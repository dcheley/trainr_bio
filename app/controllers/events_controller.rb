class EventsController < ApplicationController
  before_action :load_event, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    start_of_week = Date.today
    end_of_week = Date.today.end_of_week
    @events = @user.trainer_events.where(date: start_of_week..end_of_week)
    start_of_next_week = end_of_week + 1.day
    end_of_next_week = start_of_next_week + 6.day
    @next_week_events = @user.trainer_events.where(date: start_of_next_week..end_of_next_week)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to user_path(@event.trainer_id), notice: "Event created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to user_url(@event.trainer_id), notice: "Event details updated!"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to user_url(@event.trainer_id), notice: "Event deleted."
  end

  def manage_events
    @user = current_user
    @events = current_user.events
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :title, :duration, :start_time, :date, :recurring, :location,
      :trainer_id, :trainee_id
    )
  end

end
