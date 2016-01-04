class Post < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  # Add relationships with users and hikes.
  belongs_to :user
  belongs_to :hike
  default_scope -> { order(created_at: :desc) }
end
