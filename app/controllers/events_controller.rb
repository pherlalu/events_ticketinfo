class EventsController < ApplicationController
  def index
    @events = Event.order(:name).page(params[:page]).per(10)
  end

  def show
    @event = Event.find(params[:id])
  end
end
