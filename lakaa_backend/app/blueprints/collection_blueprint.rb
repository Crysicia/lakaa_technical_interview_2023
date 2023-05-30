class CollectionBlueprint < Blueprinter::Base
  identifier :id

  field :organization_name
  field :collected_at do |collection, _options|
    "#{collection.collected_at.utc.iso8601}"
  end

  view :with_indicators do
    association :collection_indicators, blueprint: CollectionIndicatorBlueprint, view: :simple
  end
end
