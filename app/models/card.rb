class Card < ApplicationRecord
  validates :user, :customer_id, :card_id, presence: true
  validates :user, uniqueness: true

  belongs_to :user
end
