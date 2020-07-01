class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth_day, presence: true
         has_one :card
         has_many :items
         has_one :destination
end
