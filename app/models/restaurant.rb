class Restaurant < ApplicationRecord
  validates :restaurant_name, presence: true
  validates :restaurant_price, presence: true
  validates :restaurant_cuisine, presence: true
  validates :restaurant_address, presence: true

  has_many :reviews, dependent: :destroy

  def average_rating
    @sum = 0
    self.reviews.each { |review| @sum += review.rating }
    (@sum.to_f/ self.reviews.count).round(1)
  end

end
