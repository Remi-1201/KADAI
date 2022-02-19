class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    has_one_attached :avatar do |attachable|
        attachable.variant :thumb, resize: "100x100"
      end
    mount_uploader :avatar, ImageUploader
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    has_secure_password
    validates :password, length: { minimum: 6 }
end
