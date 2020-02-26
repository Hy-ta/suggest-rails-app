class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
end
