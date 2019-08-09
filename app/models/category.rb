class Category < ApplicationRecord
  belongs_to :genre

  validates :name, null: false
  validates :genre_id, null: false
end