class Blog < ApplicationRecord
    belongs_to :user, optional: true
    mount_uploader :image, ImageUploader
    mount_uploader :avatar, ImageUploader

end
