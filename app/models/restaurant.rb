class Restaurant < ApplicationRecord
  validates :restaurant_name, presence: true
  validates :restaurant_price, presence: true
  validates :restaurant_cuisine, presence: true
  validates :restaurant_address, presence: true

  has_many :reviews
end
