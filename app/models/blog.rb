class Blog < ApplicationRecord
    validates :content, presence: true,length: { in: 1..30 }
    
    belongs_to :user
    validates :user_id, presence: true
    
    has_many :favorites,dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    
    mount_uploader :image, ImageUploader
end
