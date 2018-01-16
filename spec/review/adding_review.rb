require 'rails_helper.rb'
require 'web_helper.rb'

feature 'Creating restaurant' do

  before(:each) do
    visit('restaurants/')
    click_link 'Add restaurant'
    create_restaurant("Valentina's Bistro", "Italian mush", 5, "Look at train schedule")
  end

  scenario 'Can create a review which will be displayed on the restaurant show page' do
    create_review("Lovely Italian Mush", 5, "Despite the bumpy ride the Italian mush slipped down my gullet with grace")
    expect(page).to have_content("Lovely Italian Mush")
  end

  scenario 'Can create a multiple reviews which will be displayed on the restaurant show page' do
    create_review("Tasty grub", 3, "Yummy stuff all to say really")
    create_review("Not a fan", 2, "Had better meals afraid to say")
    expect(page).to have_content("Lovely Italian Mush").and have_content("Not a fan")
  end

end
