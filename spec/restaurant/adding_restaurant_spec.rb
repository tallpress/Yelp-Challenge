require 'rails_helper.rb'
require 'web_helper.rb'

feature 'Creating restaurant' do

  # signup_charles = signup("charles@hotmial.com", '123456')
  # signup_lars = signup("lars@hotmial.com", '123456')
  # signup_valentina = signup("valentina@hotmial.com", '123456')
  # signup_tom = signup("tom@hotmial.com", '123456')

  before(:each) do
    visit('/')
  end

  scenario 'test restaurant DB table is being cleaned after each test suite' do
    expect(page).not_to have_content("Boyce's beans")
  end

  scenario 'can create a restaurant with right details' do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("Boyce's beans", "Bean based foods", 3, "Waterloo Station")
    expect(page).to have_content("Boyce's beans")
  end

  scenario 'can view restaurant created on restaurants/ page' do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("Mcdonalds", "Fast food", 1, "Waterloo Station")
    click_link 'Back'
    expect(page).to have_content("Mcdonalds")
  end

  scenario 'test restaurant DB table is being cleaned after each test' do
    expect(page).to have_content("Hoot")
    expect(page).not_to have_content("Boyce's beans")
  end

  scenario "can't save a restaurant with wrong details" do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("Arnold's Chicken Hut", "", 3, "Paddington Station")
    visit('restaurants/')
    expect(page).not_to have_content("Arnold's Chicken Hut")
  end

  scenario "restaurants/new should have a form" do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    expect(page).to have_field("restaurant[restaurant_name]")
    expect(page).to have_field("restaurant[restaurant_cuisine]")
    expect(page).to have_field("restaurant[restaurant_address]")
  end

  scenario "failing to enter correct details should display a relative error" do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("itsu", "sushi", 3, "")
    expect(page).to have_content("error")
  end

  scenario "Can edit a restaurant successfully" do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("Riverwood Lotus", "Fresh", 3, "Lake district")
    expect(page).to have_content("Riverwood Lotus")
    click_link 'Edit'
    update_restaurant("The hungry Caterpillar", "Fresh", 3, "Lake district")
    expect(page).not_to have_content("Riverwood Lotus")
    expect(page).to have_content("The hungry Caterpillar")
  end

  scenario "Checks that the restaurant is deleted from the list" do
    signup("charles@hotmial.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("Chez Charles", "Haute cuisine", 5, "Holland Park")
    click_link 'Back'
    expect(page).to have_content("Chez Charles")
    click_link 'Delete'
    expect(page).not_to have_content("Chez Charles")
  end
end
