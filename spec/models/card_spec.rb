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
end
