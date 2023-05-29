# == Schema Information
#
# Table name: collection_indicators
#
#  id            :bigint           not null, primary key
#  collection_id :bigint           not null
#  indicator_id  :bigint           not null
#  value         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CollectionIndicator < ApplicationRecord
  belongs_to :collection
  belongs_to :indicator

  validates :value, presence: true
end
