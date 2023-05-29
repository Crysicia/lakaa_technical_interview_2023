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
require "test_helper"

class CollectionIndicatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
