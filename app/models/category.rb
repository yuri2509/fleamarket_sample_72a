class Category < ApplicationRecord
  # validates :name, presence: true

  has_many :items
  has_ancestry
end
