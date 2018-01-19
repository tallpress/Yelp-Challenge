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

def create_review(title, rating, body)
  fill_in 'review[title]', with: "#{title}"
  select rating, from: "review[rating]"
  fill_in 'review[body]', with: "#{body}"
  click_button 'Create Review'
end

def signup(email, password)
  click_link('Login/Signup')
  click_link 'Sign up'
  find("#email_field").set email
  find("#password_field").set password
  find("#password_confirmation_field").set password
  click_button 'Sign up'
end
