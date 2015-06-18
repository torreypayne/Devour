require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_path
    expect(page).to have_content "New user"
  end

  feature "signing up a user", js: true do
    before(:each) do
      deck = create(:deck)
      visit new_user_path
      fill_in 'email', :with => "bull@shit.com"
      fill_in 'password', :with => "tonsofit"
      click_on "Sign Up!"
    end

    scenario "redirects to deck index page after signup" do
      expect(page).to have_content "Time to eat! What are you looking to study today?"
    end

    scenario "can add new decks" do
      click_on "Add"
      fill_in 'Title', :with => 'French'
      fill_in 'Course ID', :with => 9
      click_on "Public"
      click_on "Create Your New Deck. Go Study."
      expect(page).to have_content "French"
    end

    scenario "can search for decks" do
      click_on "Add"
      fill_in 'Title', :with => 'French'
      fill_in 'Course ID', :with => 9
      click_on "Public"
      click_on "Create Your New Deck. Go Study."
      click_on "Search"
      wait_for_ajax
      fill_in "title", :with => 'F'
      expect(page).to have_content "French"
    end

    scenario "can add Public decks" do
      click_on "Public Decks"
      expect(page).to have_content deck.title
    end

    scenario "adds decks once" do
      click_on "Add"
      fill_in 'Title', :with => 'French'
      fill_in 'Course ID', :with => 9
      click_on "Public"
      click_on "Create Your New Deck. Go Study."
      page.all("h2.panel-heading").count.should eq(1)
      save_and_open_page
    end
  end
end
