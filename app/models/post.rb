class Post < ApplicationRecord

  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy #dependent: :destroy will delete likes if post/user is deleted
  validates :message, presence: true
  validate :image_type
  delegate :name, :to => :user

  def thumbnail (input)
    return self.images[input].variant(resize: '300x300!').processed
  end

  private
  def image_type
    # if images.attached? == false
    #   errors.add(:images, "are missing!")
    # end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png image/gif'))
      errors.add(:images, "Needs to be a JPEG or PNG")
      end
      end
  end


end


