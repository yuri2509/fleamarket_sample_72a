class Purchase < ApplicationRecord
  validates :user_id, :item_id, presence: true

  belongs_to :user
  belongs_to :item
end
