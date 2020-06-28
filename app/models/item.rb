class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :category
  belongs_to :brand

  validates :name, :price, :description, :status, :size, :cost, :days, :prefecture, :category, :brand, :user, presence: true
end
