class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  # accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :item
end
