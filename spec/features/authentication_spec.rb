require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'email', :with => "bull@shit.com"
      fill_in 'password', :with => "tonsofit"
      click_on "Create User"
    end

    scenario "redirects to deck index page after signup" do
      expect(page).to have_content "Your Collection"
    end
  end

end
