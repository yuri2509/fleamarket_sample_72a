class Destination < ApplicationRecord
  belongs_to :user
  validates :family_name, :first_name, :family_name_reading, :first_name_reading, 
            :post_code, :prefecture, :city, :address, :phone_number, presence: true
end
