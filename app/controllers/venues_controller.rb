class VenuesController < ApplicationController
  def index
    @venues = Venue.includes(:events).order('events.date_time DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
    @venue = Venue.find(params[:id])
    @events = @venue.events.order(:date_time).paginate(page: params[:page], per_page: 10)
  end
end
