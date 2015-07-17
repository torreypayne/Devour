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

require 'rails_helper'

describe Card do
  describe "validations" do
    it { should validate_presence_of(:deck_id) }
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:answer) }
  end

  describe "associations" do
    it { should belong_to(:deck) }
    it { should have_many(:responses) }
    it { should have_one(:owner) }
  end

  describe "correctly checks for its review status" do
    let(:user) { create(:user) }
    let(:card) { create(:card) }

    it "should have a new response" do
      expect(card.latest_response(user.id)).to be_a(Response)
    end

    #  Need to find way to test last_passed method for accuracy
    # it "should need to be reviewed" do
    #   expect(card.needs_review?(user.id)).to be(true)
    # end

    # describe "it should correctly assess responses for user" do
    #   let(:user) { create(:user) }
    #   let(:deck) { create(:deck, owner: user) }
    #   let(:card) { create(:card, deck: deck) }
    #   let(:resp) { create(:response, card: card) }
    #
    #   it "should need to be reviewed after a response of 0" do
    #     expect(card.needs_review?(user.id)).to be(true)
    #     resp.quality = 0
    #     resp.assert_response(user.id)
    #     expect(card.needs_review?(user.id)).to be(true)
    #   end
    #
    #   it "should need to be reviewed after a response of 1" do
    #     expect(card.needs_review?(user.id)).to be(true)
    #     resp.quality = 1
    #     resp.assert_response(user.id)
    #     expect(card.needs_review?(user.id)).to be(true)
    #   end
    #
    #   it "should not need to be reviewed after a response of 2" do
    #     expect(card.needs_review?(user.id)).to be(true)
    #     resp.quality = 2
    #     resp.assert_response(user.id)
    #     expect(card.needs_review?(user.id)).to be(false)
    #   end
    #
    #   it "should not need to be reviewed after a response of 3" do
    #     expect(card.needs_review?(user.id)).to be(true)
    #     resp.quality = 3
    #     resp.assert_response(user.id)
    #     expect(card.needs_review?(user.id)).to be(false)
    #   end
    #
    #   it "should not need to be reviewed after a response of 4" do
    #     expect(card.needs_review?(user.id)).to be(true)
    #     resp.assert_response(user.id)
    #     expect(card.needs_review?(user.id)).to be(false)
    #   end
    #
    #   it "should not need to be reviewed after a response of 5" do
    #     expect(card.needs_review?(user.id)).to be(true)
    #     resp.quality = 5
    #     resp.assert_response(user.id)
    #     expect(card.needs_review?(user.id)).to be(false)
    #   end
    # end
  end
end
