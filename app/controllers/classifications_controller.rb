class ClassificationsController < ApplicationController
  before_action :set_classification, only: [:show]

  def index
    @classifications = Classification.all.page(params[:page]).per(10)
    @classifications = @classifications.where(category_id: params[:category_id]) if params[:category_id].present?
  end
  
  def show
    @events = @classification.events.order(:date_time).page(params[:page]).per(10)
  end  

  private

  def set_classification
    @classification = Classification.find(params[:id])
  end
end
