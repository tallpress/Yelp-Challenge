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
  click_link 'Login/Signup'
  click_link 'Sign up'
  fill_in 'email', with: "#{email}"
  fill_in 'password', with: "#{password}"
  fill_in 'password_confirmation', with: "#{password}"
  click_button 'Sign up'
end

signup_charles = signup("charles@hotmial.com", '123456')
signup_lars = signup("lars@hotmial.com", '123456')
signup_valentina = signup("valentina@hotmial.com", '123456')
signup_tom = signup("tom@hotmial.com", '123456')
