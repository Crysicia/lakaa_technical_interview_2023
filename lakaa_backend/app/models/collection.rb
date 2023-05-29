# == Schema Information
#
# Table name: collections
#
#  id                :bigint           not null, primary key
#  collected_at      :datetime         not null
#  organization_name :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Collection < ApplicationRecord
  has_many :collection_indicators, dependent: :destroy
  has_many :indicators, through: :collection_indicators, dependent: :destroy

  validates :organization_name, presence: true
  validates :collected_at, comparison: { less_than_or_equal_to: Date.today }
end
