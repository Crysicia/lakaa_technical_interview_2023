class Indicator < ApplicationRecord
  has_many :collection_indicators, dependent: :destroy
  has_many :collections, through: :collection_indicators, dependent: :destroy
end
