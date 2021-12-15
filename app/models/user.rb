class User < ApplicationRecord
  
  # has_many :posts
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true
  validates :password, length: { minimum: 8, maximum: 20 }, allow_blank: true
  validates :name, presence: true
  has_one_attached :image
 
end