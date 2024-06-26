class SearchController < ApplicationController
  def index
    @query = params[:query]
    @classification_id = params[:classification_id]

    @events = Event.includes(:classifications)

    if @query.present?
      @events = @events.where("events.name LIKE ?", "%#{@query}%")
    end

    if @classification_id.present?
      @events = @events.where(classifications: { id: @classification_id })
    end

    @events = @events.order(:name).paginate(page: params[:page], per_page: 10)
  end
end
