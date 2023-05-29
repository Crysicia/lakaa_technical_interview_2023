class CollectionIndicatorBlueprint < Blueprinter::Base
  identifier :id

  field :value

  view :normal do
    association :indicator, blueprint: IndicatorBlueprint
  end

  view :simple do
    field :name do |collection_indicator, _options|
      "#{collection_indicator.indicator.name}"
    end

    field :unit do |collection_indicator, _options|
      "#{collection_indicator.indicator.unit}"
    end

    field :required do |collection_indicator, _options|
      "#{collection_indicator.indicator.required}"
    end
  end
end
