class Review < ApplicationRecord
  belongs_to :restaurant

  belongs_to :user

  validates :title, :body, :rating, presence:true
end
