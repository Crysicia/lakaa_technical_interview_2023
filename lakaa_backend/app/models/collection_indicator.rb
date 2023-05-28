class CollectionIndicator < ApplicationRecord
  belongs_to :collection
  belongs_to :indicator

  # delegate :value, to: :indicator
end
