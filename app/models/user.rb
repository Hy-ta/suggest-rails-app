class User < ApplicationRecord
  mount_uploader :img, ImgUploader
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :name,    presence: true
  validate  :validate_name_not_including_comma
  validates :char_id, length: { maximum: 12 }
  validates :email,   format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length: {maximum: 12}
  validates :password_confirmation, confirmation: true

   def self.find_for_oauth(auth)
     ser = User.where(uid: auth.uid, provider: auth.provider).first
       unless user
         user = User.create(
         uid:      auth.uid,
         provider: auth.provider,
         name:  auth.info.name,
         email:    auth.info.email,
         password: Devise.friendly_token[0, 20]
         )
       end
      user
   end

   private

    def validate_name_not_including_comma
      errors.add(:name, 'cant be contanied comma') if name&.include?(',')
    end
end
