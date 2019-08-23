class Category < ApplicationRecord
  belongs_to :genre
  has_many :talks, dependent: :destroy
  has_many :users, through: :category_users
  has_many :category_users, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
end