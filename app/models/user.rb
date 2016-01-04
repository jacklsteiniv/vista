class User < ActiveRecord::Base

  include Gravtastic
  gravtastic

  has_secure_password
  attr_accessor :name, :email

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: {minimum: 8}

  has_many :posts
  has_many :hikes, through: :posts
end
