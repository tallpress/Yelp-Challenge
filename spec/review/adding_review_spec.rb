require 'web_helper'
require 'rails_helper.rb'
require 'capybara'


feature 'Review restaurant' do

  before(:each) do
    visit('/')
    signup("lars@hotmeow.com", '123456')
    click_link 'Add restaurant'
    create_restaurant("Lars's Bistro", "Italian mush", 5, "Look at train schedule")
  end

  scenario 'Can create a review which will be displayed on the restaurant show page' do
    click_link 'Logout'
    signup("valentina@hotmial.com", '123456')
    click_link 'Show'
    create_review("Lovely Italian Mush", 5, "Despite the bumpy ride the Italian mush slipped down my gullet with grace")
    expect(page).to have_content("Lovely Italian Mush")
  end

  scenario 'Can create multiple reviews which will be displayed on the restaurant show page' do
    click_link 'Logout'
    signup("valentina@hotmial.com", '123456')
    click_link 'Show'
    create_review("Tasty grub", 3, "Yummy stuff all to say really")
    click_link 'Logout'
    signup("tom@hotmial.com", '123456')
    click_link 'Show'
    create_review("Not a fan", 2, "Had better meals afraid to say")
    expect(page).to have_content("Tasty grub")
    expect(page).to have_content("Not a fan")
  end

  scenario 'Average rating is displayed as a once decimal float' do
    click_link 'Logout'
    signup("valentina@hotmial.com", '123456')
    click_link 'Show'
    create_review("Very nice", 3, "Yeah, really nice")
    click_link 'Logout'
    signup("tom@hotmial.com", '123456')
    click_link 'Show'
    create_review("not so nice", 2, "no, not very nice")
    expect(page).to have_content("2.5")
  end

  scenario "Users can't add more than one review on a restaurant" do
    click_link 'Logout'
    signup("valentina@hotmial.com", '123456')
    click_link 'Show'
    create_review("Lovely Italian Mush", 5, "Despite the bumpy ride the Italian mush slipped down my gullet with grace")
    create_review("Average Mush", 5, "Why would I review this place twice")
    expect(page).to have_content("You can only review an establishment once")
  end

  scenario "Users can't review their own restaurant" do
    create_review("Lovely Italian Mush", 5, "Despite the bumpy ride the Italian mush slipped down my gullet with grace")
    expect(page).to have_content("It is against company policy to review your own restaurant")
  end

  scenario "Users can delete only their own review " do
    click_link 'Logout'
    signup("valentina@hotmial.com", '123456')
    click_link 'Show'
    create_review("Lovely Italian Mush", 5, "Despite the bumpy ride the Italian mush slipped down my gullet with grace")
    expect(page).to have_content("Lovely Italian Mush")
    click_link 'Delete'
    expect(page).to_not have_content("Lovely Italian Mush")
  end

  scenario "Users can not delete another person review " do
    click_link 'Logout'
    signup("valentina@hotmial.com", '123456')
    click_link 'Show'
    create_review("Lovely Italian Mush", 5, "Despite the bumpy ride the Italian mush slipped down my gullet with grace")
    click_link 'Logout'
    login("lars@hotmeow.com", '123456')
    click_link 'Show'
    expect(page).to_not have_content("Delete")
  end

end
