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
require "test_helper"

class IndicatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
