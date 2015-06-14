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

require 'spec_helper'

describe Deck do
  describe "validations" do
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:public) }
  end

  describe "associations" do
    it { should have_many(:cards) }
    it { should have_many(:users) }
    it { should have_many(:deck_shares) }
    it { should have_many(:responses) }
    it { should belong_to(:owner) }
  end

end
