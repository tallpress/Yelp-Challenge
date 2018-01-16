def create_restaurant(name, cuisine, price_rating, address)
  fill_in 'restaurant[restaurant_name]', with: "#{name}"
  fill_in 'restaurant[restaurant_cuisine]', with: "#{cuisine}"
  select price_rating, from: "restaurant[restaurant_price]"
  fill_in 'restaurant[restaurant_address]', with: "#{address}"
  click_button 'Create Restaurant'
end

def update_restaurant(name, cuisine, price_rating, address)
  fill_in 'restaurant[restaurant_name]', with: "#{name}"
  fill_in 'restaurant[restaurant_cuisine]', with: "#{cuisine}"
  select price_rating, from: "restaurant[restaurant_price]"
  fill_in 'restaurant[restaurant_address]', with: "#{address}"
  click_button 'Update Restaurant'
end
