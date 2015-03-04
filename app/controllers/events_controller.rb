class EventsController < ApplicationController
  before_action do
    @company = Company.find(params[:company_id])
  end

  def index
    @events = @company.events
  end

  def new
    @event = @company.events.new
  end

  def create
    @event = @company.events.new(event_params)
    if @event.save
      redirect_to company_events_path(@company), notice: 'New Event created!'
    else
      render :new
    end
  end

  def show
    @event = @company.events.find(params[:id])
  end

  def edit
    @event = @company.events.find(params[:id])
  end

  def update
    @event = @company.events.find(params[:id])
    if @event.update(event_params)
      redirect_to company_event_path(@company, @event), notice: 'Event updated!'
    else
      render :edit
    end
  end

  def destroy
    @company.events.destroy(params[:id])
    redirect_to company_events_path(@company), notice: 'Event deleted!'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
