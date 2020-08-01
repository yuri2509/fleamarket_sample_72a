class Card < ApplicationRecord
  validates :user, :payjp :card_id, presence: true
  validates :user, :card_id, uniqueness: true

  belongs_to :user
end
