# == Schema Information
#
# Table name: deck_shares
#
#  id         :integer          not null, primary key
#  deck_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

# RSpec.describe DeckShare, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe DeckShare do
  describe "validations" do
    it { should validate_presence_of(:deck_id) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:deck) }
  end
end
