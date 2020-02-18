class User < ApplicationRecord
  mount_uploader :img, ImgUploader
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

         validates :name,    presence: true
         validates :char_id, length: { maximum: 12 }
         validates :email,   presence: true
         validates :password, presence: true, length: {maximum: 12}

         def self.find_oauth(auth)
           user = User.where(uid: auth.uid, provider: auth.provider).first
           
           unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              email:    auth.info.email,
              password: Devise.friendly_token[0, 20]
            )
         end
         user
        end
end
