class Collection < ApplicationRecord
  has_many :collection_indicators, dependent: :destroy
  has_many :indicators, through: :collection_indicators, dependent: :destroy
end
