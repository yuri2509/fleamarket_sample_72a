class Card < ApplicationRecord
  validates :user_id, :customer_id, :card_id, presence: true
  validates :user_id, uniqueness: true

  belongs_to :user
end
