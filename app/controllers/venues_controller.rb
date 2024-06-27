class VenuesController < ApplicationController
  def index
    @venues = Venue.includes(:events).order('events.date_time DESC').page(params[:page]).per(10)
  end
  
  def show
    @venue = Venue.find(params[:id])
    @events = @venue.events.order(:date_time).page(params[:page]).per(10)
  end

  def map
    @venue = Venue.find(params[:id])
  end
  
end
