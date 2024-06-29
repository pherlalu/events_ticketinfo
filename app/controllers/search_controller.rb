class SearchController < ApplicationController
  def index
    @query = params[:query]
    @classification_id = params[:classification_id]

    @events = Event.joins(:artists).includes(:classifications)

    if @query.present?
      @events = @events.where("events.name LIKE ? OR artists.name LIKE ?", "%#{@query}%", "%#{@query}%")
    end

    if @classification_id.present?
      @events = @events.where(classifications: { id: @classification_id })
    end

    @events = @events.order(:name).page(params[:page]).per(10)
  end
end
