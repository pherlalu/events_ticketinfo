class ArtistsController < ApplicationController
  def index
    @artists = Artist.includes(:events).order('events.date_time DESC').paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @artist = Artist.find(params[:id])
    @events = @artist.events.order(:date_time).paginate(page: params[:page], per_page: 10)
  end
end
