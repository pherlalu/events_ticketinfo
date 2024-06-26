class ClassificationsController < ApplicationController
  before_action :set_classification, only: [:show]

  def index
    @classifications = Classification.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @events = @classification.events.order(:date_time).paginate(page: params[:page], per_page: 10)
  end

  private

  def set_classification
    @classification = Classification.find(params[:id])
  end
end
