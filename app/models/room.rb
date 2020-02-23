class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :user, through: :messages

    validates :name, presence: true, uniqueness: true
end
