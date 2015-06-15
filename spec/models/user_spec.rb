require 'spec_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
  end

  describe "associations" do
    it { should have_many(:owned_decks) }
    it { should have_many(:deck_shares) }
    it { should have_many(:decks) }
    it { should have_many(:cards) }
    it { should have_many(:responses) }
  end

  describe "methods" do

  end
end
