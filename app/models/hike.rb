class Hike < ActiveRecord::Base
  validates :pattern, presence: true

  has_many :reviews
  has_many :users, through: :reviews
end
