# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  password_digest        :string           not null
#  session_token          :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  password_reset_digest  :string
#  password_reset_sent_at :datetime
#

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
