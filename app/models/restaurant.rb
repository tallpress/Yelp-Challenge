class Restaurant < ApplicationRecord
  validates :restaurant_name, presence: true,
                    length: {minimum:5, maximum: 50}
  validates :restaurant_price, presence: true
  validates :restaurant_cuisine, presence: true
  validates :restaurant_address, presence: true
end
