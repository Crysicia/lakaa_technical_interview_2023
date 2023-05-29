class IndicatorsController < ApplicationController
  before_action :set_indicator, only: %i[ show update destroy ]

  def index
    @indicators = Indicator.all.order(:id)

    render json: IndicatorBlueprint.render(@indicators)
  end

  def show
    render json: IndicatorBlueprint.render(@indicator)
  end

  def create
    @indicator = Indicator.new(indicator_params)

    if @indicator.save
      render json: IndicatorBlueprint.render(@indicator), status: :created, location: @indicator
    else
      render json: @indicator.errors, status: :unprocessable_entity
    end
  end

  def update
    if @indicator.update(indicator_params)
      render json: IndicatorBlueprint.render(@indicator)
    else
      render json: @indicator.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @indicator.destroy
  end

  private
    def set_indicator
      @indicator = Indicator.find(params[:id])
    end

    def indicator_params
      params.require(:indicator).permit(:name, :unit, :required)
    end
end
