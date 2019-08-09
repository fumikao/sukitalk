class Category < ApplicationRecord
  belongs_to :genre
  has_many :talks, dependent: :destroy

  validates :name, presence: true
  validates :genre_id, presence: true
end