class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name,    presence: true
         validates :char_id, length: { maximum: 12 }
         validates :email,   presence: true
         validates :password, presence: true, length: {maximum: 12}
end
