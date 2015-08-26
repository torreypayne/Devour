# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Post do
    describe "validations" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:user_id) }
    end
    
    describe "associations" do
        it { should belong_to(:author) }
        it { should have_many(:comments) }
        it { should have_many(:post_subs) }
        it { should have_many(:subs) }
    end
    
    context "User creates posts" do
        let(:user) { create(:user) }
        let(:subforum) { user.subs.new }
        
        it "can be created by a User" do
            let(:post) { subforum.posts.new(user_id: user.id) }
            expect(post.author).to eq(user)
            expect(subforum.posts.first).to eq(post)
        end
    end
end