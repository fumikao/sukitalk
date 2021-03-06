class Genre < ApplicationRecord
  has_many :categories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
end
