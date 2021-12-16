class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true
  validates :password, length: { minimum: 8, maximum: 20 }, allow_blank: true
  validates :name, presence: true
  has_one_attached :image
  validate :image_type

  private

  def image_type
    if image.attached? == false
      # puts "MAIN ERROR: #{errors.count}"
      # errors.each {|x| puts "Here are the errors: #{x}" }
      errors.add(:image, "are missing!")
    else
      if !image.content_type.in?(%('image/jpeg image/png image/gif'))
        errors.add(:image, "Needs to be a JPEG, PNG or GIF")
      end
    end
  end
end