class Restaurant < ApplicationRecord

  validates :restaurant_name, presence: true
  validates :restaurant_price, presence: true
  validates :restaurant_cuisine, presence: true
  validates :restaurant_address, presence: true

  belongs_to :user

  has_many :reviews, dependent: :destroy

  def average_rating
    (get_ratings.sum.to_f/ self.reviews.count).round(1)
  end

  def not_yet_reviewed?
    self.reviews.empty?
  end

  private
  def get_ratings
    self.reviews.map { |review| review.rating }
  end

end
