class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128

         validates :nickname, :birth_day, :family_name, :first_name, :family_name_reading, :first_name_reading, :encrypted_password, presence: true
         validates :family_name,
          format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
         validates :first_name,
          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
         validates :family_name_reading,
          format: { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }
         validates :first_name_reading,
          format: { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }
         has_one :card
         has_many :items
         has_one :destination
         has_many :purchases

end
