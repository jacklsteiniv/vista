class Hike < ActiveRecord::Base
  validates :user_id, presence: true

  has_many :posts, dependent: :destroy
  has_many :users, through: :posts

  default_scope -> { order(created_at: :desc) }
end
