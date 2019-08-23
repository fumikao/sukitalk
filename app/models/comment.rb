class Comment < ApplicationRecord
  belongs_to :talk
  belongs_to :user

  validates :content, presence: true, length: { maximum: 200 }
end
