require 'rails_helper.rb'
require 'web_helper.rb'

feature 'Creating restaurant' do

  before(:each) do
    visit('restaurants/')
  end

  scenario 'test restaurant table is being cleaned after each test suite' do
    expect(page).not_to have_content("Boyce's beans")
  end

  scenario 'can create a restaurant with right details' do
    click_link 'Add restaurant'
    create_restaurant("Boyce's beans", "Bean based foods", 3, "Waterloo Station")
    expect(page).to have_content("Boyce's beans")
  end

  scenario 'can view restaurant created on restaurants/ page' do
    click_link 'Add restaurant'
    create_restaurant("Mcdonalds", "Fast food", 1, "Waterloo Station")
    click_link 'Back'
    expect(page).to have_content("Mcdonalds")
  end

  scenario 'test restaurant table is being cleaned after each test' do
    expect(page).to have_content("Listing restaurant")
    expect(page).not_to have_content("Boyce's beans")
  end

  scenario "can't save a restaurant with wrong details" do
    click_link 'Add restaurant'
    create_restaurant("Arnold's Chicken Hut", "", 3, "Paddington Station")
    visit('restaurants/')
    expect(page).not_to have_content("Arnold's Chicken Hut")
  end

  scenario "restaurants/new should have a form" do
    click_link 'Add restaurant'
    expect(page)
      .to have_field("restaurant[restaurant_name]")
      .and have_field("restaurant[restaurant_cuisine]")
      .and have_field("restaurant[restaurant_address]")
  end

  scenario "failing to enter correct details should display a relative error" do
    click_link 'Add restaurant'
    create_restaurant("itsu", "sushi", 3, "Embankment")
    expect(page).to have_content("Restaurant name is too short (minimum is 5 characters)")
  end

  scenario "Can edit a restaurant successfully" do
    click_link 'Add restaurant'
    create_restaurant("Riverwood Lotus", "Fresh", 3, "Lake district")
    expect(page).to have_content("Riverwood Lotus")
    click_link 'Edit'
    update_restaurant("The hungry Caterpillar", "Fresh", 3, "Lake district")
    expect(page).not_to have_content("Riverwood Lotus")
    expect(page).to have_content("The hungry Caterpillar")
  end

end
