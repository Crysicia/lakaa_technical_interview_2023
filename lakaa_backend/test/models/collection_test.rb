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
require "test_helper"

class CollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
