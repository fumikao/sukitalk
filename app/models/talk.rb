class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :category_id, presence: true
end
