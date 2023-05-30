# == Schema Information
#
# Table name: indicators
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  unit       :string           not null
#  required   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted    :boolean          default(FALSE), not null
#
class Indicator < ApplicationRecord
  scope :displayable, -> { where(deleted: false) }

  has_many :collection_indicators, dependent: :destroy
  has_many :collections, through: :collection_indicators, dependent: :destroy

  validates :name, presence: true
  validates :unit, presence: true
  validates :required, inclusion: [true, false]

  def destroy
    update(deleted: true)
  end
end
