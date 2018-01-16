class Review < ApplicationRecord
  belongs_to :restaurant

  validates :title, :body, :rating, presence:true
end
