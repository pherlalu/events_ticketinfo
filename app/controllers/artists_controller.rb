class ArtistsController < ApplicationController
  def index
    @artists = Artist.includes(:events).order('events.date_time DESC').page(params[:page]).per(10)
  end
  
  def show
    @artist = Artist.find(params[:id])
    @events = @artist.events.order(:date_time).page(params[:page]).per(10)
  end
end
