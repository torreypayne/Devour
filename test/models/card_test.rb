# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  deck_id    :integer          not null
#  question   :text             not null
#  answer     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
