require 'rails_helper.rb'

feature 'Creating restaurant' do

  before do
    visit('restaurants/')
  end

  scenario 'can create a restaurant with right details' do
    click_link 'Add restaurant'
    fill_in 'restaurant[restaurant_name]', with: "Boyce's beans"
    fill_in 'restaurant[restaurant_cuisine]', with: "Bean based foods"
    fill_in 'restaurant[restaurant_price]', with: "3"
    fill_in 'restaurant[restaurant_address]', with: "Waterloo Station"
    click_button 'Save Restaurant'
    expect(page).to have_content("Boyce's beans")
  end

  scenario "can't save a restaurant with wrong details" do
    click_link 'Add restaurant'
    fill_in 'restaurant[restaurant_name]', with: "Arnold's Chicken Hut"
    fill_in 'restaurant[restaurant_cuisine]', with: ""
    fill_in 'restaurant[restaurant_price]', with: "3"
    fill_in 'restaurant[restaurant_address]', with: "Waterloo Station"
    click_button 'Save Restaurant'
    visit('restaurants/')
    expect(page).not_to have_content("Arnold's Chicken Hut")
  end

  scenario "failing to enter correct details should display a relative error" do
    click_link 'Add restaurant'
    fill_in 'restaurant[restaurant_name]', with: "itsu"
    fill_in 'restaurant[restaurant_cuisine]', with: "sushi"
    fill_in 'restaurant[restaurant_price]', with: "3"
    fill_in 'restaurant[restaurant_address]', with: "Waterloo Station"
    click_button 'Save Restaurant'
    visit('restaurants/')
    expect(page).not_to have_content("Restaurant name is too short (minimum is 5 characters)")
  end

end
