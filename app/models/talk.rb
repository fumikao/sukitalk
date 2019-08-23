class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy

  validate :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :category_id, presence: true
end