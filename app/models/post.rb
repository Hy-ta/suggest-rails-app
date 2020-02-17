class Post < ApplicationRecord
    mount_uploader :img, ImgUploader
    validates :title, presence: true, length: {maximum: 50}
    validates :content, presence: true, length:{maximum: 1060}
    
    belongs_to :user
    has_many :comments, dependent: :destroy

    default_scope ->  { order(created_at: :desc) }

end
