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
      click_on "Sign Up!"
    end

    scenario "redirects to deck index page after signup" do
      expect(page).to have_content "Your Collection"
    end

    scenario "renders Shared Decks Index" do
      expect(page).to have_content "What are you looking to study today?"
    end

    scenario "can add new decks" do
      click_on "Add"
      fill_in 'Title', :with => 'French'
      fill_in 'Course ID', :with => 9
      click_on "Public"
      click_on "Create Your New Deck. Go Study."
      expect(page).to have_content "French"
    end
  end

end
