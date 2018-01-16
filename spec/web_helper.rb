def create_restaurant(name, cuisine, price_rating, address)
  fill_in 'restaurant[restaurant_name]', with: "#{name}"
  fill_in 'restaurant[restaurant_cuisine]', with: "#{cuisine}"
  fill_in 'restaurant[restaurant_price]', with: "#{price_rating}"
  fill_in 'restaurant[restaurant_address]', with: "#{address}"
  click_button 'Save Restaurant'
end

def update_restaurant(name, cuisine, price_rating, address)
  fill_in 'restaurant[restaurant_name]', with: "#{name}"
  fill_in 'restaurant[restaurant_cuisine]', with: "#{cuisine}"
  fill_in 'restaurant[restaurant_price]', with: "#{price_rating}"
  fill_in 'restaurant[restaurant_address]', with: "#{address}"
  click_button 'Update Restaurant'
end
