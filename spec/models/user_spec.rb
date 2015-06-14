require 'spec_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
  end
end
