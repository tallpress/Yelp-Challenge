require 'rails_helper.rb'
require 'web_helper.rb'

feature 'Creating restaurant' do

  # signup_charles = signup("charles@hotmial.com", '123456')
  # signup_lars = signup("lars@hotmial.com", '123456')
  # signup_valentina = signup("valentina@hotmial.com", '123456')
  # signup_tom = signup("tom@hotmial.com", '123456')

  before(:each) do
    visit('/')
    signup("charles@hotmial.com", '123456')
  end

  scenario 'test restaurant DB table is being cleaned after each test suite' do
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

  scenario 'test restaurant DB table is being cleaned after each test' do
    expect(page).to have_content("Hoot")
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
    expect(page).to have_field("restaurant[restaurant_name]")
    expect(page).to have_field("restaurant[restaurant_cuisine]")
    expect(page).to have_field("restaurant[restaurant_address]")
  end

  scenario "failing to enter correct details should display a relative error" do
    click_link 'Add restaurant'
    create_restaurant("itsu", "sushi", 3, "")
    expect(page).to have_content("error")
  end

  scenario "User can not edit or delete a restaurant of another person" do
    click_link 'Add restaurant'
    create_restaurant("Riverwood Lotus", "Fresh", 3, "Lake district")
    expect(page).to have_content("Riverwood Lotus")
    click_link "Logout"
    signup("tom@hotmial.com", '123456')
    expect(page).not_to have_content("Edit")
    expect(page).not_to have_content("Delete")
  end

  scenario "Checks that the restaurant is deleted from the list" do
    click_link 'Add restaurant'
    create_restaurant("Chez Charles", "Haute cuisine", 5, "Holland Park")
    click_link 'Back'
    expect(page).to have_content("Chez Charles")
    click_link 'Delete'
    expect(page).not_to have_content("Chez Charles")
  end

  scenario "Checks that user email is shown in all pages" do
    click_link 'Add restaurant'
    create_restaurant("Riverwood Lotus", "Fresh", 3, "Lake district")
    expect(page).to have_content("charles@hotmial.com")
    click_link 'Back'
    click_link 'Show'
    expect(page).to have_content("charles@hotmial.com")
    click_link 'Back'
    click_link 'Delete'
    expect(page).to have_content("charles@hotmial.com")
  end

  scenario "Checks that the right number of £ is shown in the price section" do
    click_link 'Add restaurant'
    create_restaurant("Riverwood Lotus", "Fresh", 3, "Lake district")
    expect(page).to have_content("£££")

  end


end
