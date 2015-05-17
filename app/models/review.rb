class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :review, presence: true, length: {minimum: 10}

end
