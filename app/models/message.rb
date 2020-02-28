class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # after_create_commit { MessageBroadcastJob.perform_later self }

  validates :content, presence: true
  scope :recent, -> { order(created_at: :desc)}
end
