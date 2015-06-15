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

  describe "assesses responses correctly" do

    let(:card) { build(:card) }
    let(:resp) { build(:response, card_id: card.id) }

    it "it is the card's latest response" do
      expect(card.latest_response).to eq(resp)
    end

    it "updates the easiness factor" do

    end

    it "updates last_passed" do

    end

    it "updates next_rep" do

    end

    it "increments repetitions by 1 if quality is greater than 1" do

    end

    it "resets repetitions if quality is equal to 0 or 1" do

    end

  end
end
