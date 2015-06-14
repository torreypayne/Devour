# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  title      :string           not null
#  course_id  :integer
#  public     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
