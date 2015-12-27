class Post < ActiveRecord::Base
  validates :content, length: { maximum: 140 }
  # Add relationships with users and hikes.
  belongs_to :user
end
