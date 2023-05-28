class CollectionIndicatorBlueprint < Blueprinter::Base
  identifier :id

  field :value
  association :indicator, blueprint: IndicatorBlueprint
end
