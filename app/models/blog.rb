class Blog < ApplicationRecord
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    mount_uploader :image, ImageUploader
    attr_accessor :action_required
    validates :image, presence: true
    validates :title, presence: true
    validates :content, presence: true
end
