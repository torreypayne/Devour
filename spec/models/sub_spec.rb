# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

describe Sub do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:moderator_id) }
  end

  describe "associations" do
    it { should belong_to(:moderator) }
    it { should have_many(:post_subs) }
    it { should have_many(:posts) }
  end
end
