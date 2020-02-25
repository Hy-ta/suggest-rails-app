class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :user_rooms
    
    validates :name, presence: true, uniqueness: true
end
