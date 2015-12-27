class Hike < ActiveRecord::Base
  validates :pattern, presence: true
  # Need a join table to link a hike with a post
  has_many :posts
  has_many :users, through: :posts
end
