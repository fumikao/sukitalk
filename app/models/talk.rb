class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy

  validates :content, presence: true, length: { maximum: 200 }
end