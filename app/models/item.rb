class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :category
  belongs_to :brand

  validates :name, :price, :description, :status, :size, :cost, :days, :prefecture, :category, :brand, :user, presence: true

  accepts_nested_attributes_for :images
  mount_uploader :image, ImageUploader
end
