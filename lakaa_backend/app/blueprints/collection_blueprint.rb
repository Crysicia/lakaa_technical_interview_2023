class CollectionBlueprint < Blueprinter::Base
  identifier :id

  field :organization_name
  field :collected_at

  view :with_indicators do
    association :collection_indicators, blueprint: CollectionIndicatorBlueprint
  end
end
