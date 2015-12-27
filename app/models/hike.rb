class Hike < ActiveRecord::Base
  validates :pattern, presence: true

  has_many :posts
  has_many :users, through: :posts
end
