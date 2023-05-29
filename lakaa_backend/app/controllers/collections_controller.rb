class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show update destroy ]

  def index
    @collections = Collection.all.order(collected_at: :desc)

    render json: CollectionBlueprint.render(@collections, view: :with_indicators)
  end

  def show
    render json: CollectionBlueprint.render(@collection, view: :with_indicators)
  end

  def create
    @collection = Collection.new(collection_params.except(:indicators))

    collection_params[:indicators].each do |indicator|
      @collection.collection_indicators.build(indicator_id: indicator[:id], value: indicator[:value])
    end

    if @collection.save
      render json: CollectionBlueprint.render(@collection, view: :with_indicators), status: :created, location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def update
    if @collection.update(collection_params.except(:indicators))
      render json: CollectionBlueprint.render(@collection, view: :with_indicators)
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collection.destroy
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:organization_name, :collected_at, indicators: [:id, :value])
    end
end
