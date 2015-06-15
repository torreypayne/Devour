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

  describe "A new card's first response is a new response" do
    let(:card) { build(:card) }
    let(:user) { create(:user) }
    it "should have a blank latest_response with default values" do
      resp = card.latest_response(user.id)
      expect(resp.class).to eq(Response)
      expect(resp.repetitions).to eq(0)
      expect(resp.e_factor).to eq(2.5)
      expect(resp.last_passed).to eq((Time.now - 1000.days.ago).to_f * 1000)
      expect(resp.next_rep).to eq(0)
    end
  end

  describe "assesses responses correctly" do
    let(:card) { create(:card) }
    let(:user) { create(:user) }
    let(:resp) { build(:response, card_id: card.id) }

    it "it is the card's latest response" do
      resp.assess_response(user.id)
      expect(card.latest_response(user.id)).to eq(resp)
    end

    it "records a new response" do
      resp.assess_response(user.id)
      expect(card.latest_response(user.id)).to eq(resp)
      resp2 = build(:response, card_id: card.id)
      resp2.assess_response(user.id)
      expect(card.latest_response(user.id)).to eq(resp2)
    end

    it "updates last_passed" do
      resp.stub(:quality).with(0)
      current_last_passed = resp.last_passed
      resp.assess_response(user.id)
      expect(resp.last_passed).to eq(current_last_passed)
    end

    it "updates next_rep" do
      resp.assess_response(user.id)
      expect(resp.next_rep).to eq(2)
    end

    it "increments repetitions by 1 if quality is greater than 1" do
      resp.assess_response(user.id)
      expect(resp.repetitions).to eq(1)
    end

    it "resets repetitions if quality is equal to 0 or 1" do
      resp.stub(:quality).with(0)
      resp.assess_response(user.id)
      expect(resp.repetitions).to eq(0)
    end

    it "updates e-factor" do
      resp.assess_response(user.id)
      expect(resp.e_factor).to eq(1.7)
    end

    it "sets upper and lower bounds on e-factor" do
      
    end

    it "should inherit e-factor, repetitions, next-repetitions interval, and last-passed from latest response" do
      resp2 = build(:response, card_id: card.id, quality: 0)
      expect(resp2.e_factor).to eq(resp1.e_factor)
      expect(resp2.repetitions).to eq(resp1.repetitions)
      expect(resp2.next_rep).to eq(resp1.next_rep)
      expect(resp2.last_passed).to eq(resp1.last_passed)
      resp2.assess_response(user.id)
      expect(resp2.e_factor).not_to eq(resp1.e_factor)
      expect(resp2.repetitions).not_to eq(resp1.repetitions)
      expect(resp2.next_rep).not_to eq(resp1.next_rep)
      expect(resp2.last_passed).not_to eq(resp1.last_passed)
    end

    describe "updates the easiness factor" do
      it "should have the same value after a response of 4" do
        resp.assess_response(user.id)
        expect(resp.e_factor).to eq(2.5)
      end

      it "should have a lower e-factor after a response of 0" do
        resp2 = build(:response, card_id: card.id, quality: 0)
        resp2.assess_response(user.id)
        expect(resp2.e_factor).to eq(1.7)
      end
    end


    it "updates appropriately after n+1 steps" do

    end

  end
end
