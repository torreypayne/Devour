# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  card_id     :integer          not null
#  quality     :integer          not null
#  e_factor    :float            default(2.5), not null
#  next_rep    :integer          not null
#  repetitions :integer          default(0), not null
#  last_passed :float            default(1434164372236.362), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

# RSpec.describe Response, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Response do
  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:card_id) }
    it { should validate_presence_of(:quality) }
    it { should validate_presence_of(:e_factor) }
    it { should validate_presence_of(:next_rep) }
    it { should validate_presence_of(:repetitions) }
    it { should validate_presence_of(:last_passed) }
  end

  describe "associations" do
    it { should belong_to(:card) }
    it { should belong_to(:user) }
    it { should have_one(:deck) }
  end
end
