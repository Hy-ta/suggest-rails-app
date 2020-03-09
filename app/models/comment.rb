class Comment < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length:{maximum: 1060}

  belongs_to :user
  belongs_to :post

  default_scope ->  { order(created_at: :desc) }

end
