class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  has_many :images
  belongs_to :user
  belongs_to :category

  validates :name, :price, :description, :status, :cost, :day, :prefecture_id, :category, :user, presence: true

  validates_associated :images
  validates :images, presence: {message: "を最低1枚選択してください"}

  validates_numericality_of :price, message: "は半角数字を入力してください"

  validates :price, numericality: { greater_than_or_equal_to: 300, message: "は300円以上にしてください" }
  validates :price, numericality: { less_than_or_equal_to: 9999999, message: "は9,999,999円以下にしてください" }
  validates :trading_status, numericality: { egreater_than_or_equal_to: 1}

  accepts_nested_attributes_for :images, allow_destroy: true

  # 商品の状態
  enum status: {
    "選択してください":0,
    "新品、未使用":1,
    "未使用に近い":2,
    "目立った傷や汚れなし":3,
    "やや傷や汚れあり":4,
    "傷や汚れあり":5,
    "全体的に状態が悪い":6,
  }, _prefix:true
  validates :status,
  format: {with: /\A(?!選択してください)/ , message: "を選択してください"}

  # 出品状況
  enum trading_status: {
    "選択してください":0,
    "出品中":1,
    "売却済み":2,
  }

  # 配送料の負担
  enum cost: {
    "選択してください":0,
    "送料込み(出品者負担)":1,
    "着払い(購入者負担)":2,
  }, _prefix:true
  validates :cost,
  format: {with: /\A(?!選択してください)/ , message: "を選択してください"}

  # 発送までの日数
  enum day: {
    "選択してください":0,
    "1〜2日で発送":1,
    "2〜3日で発送":2,
    "4〜7日で発送":3,
  }, _prefix:true
  validates :day,
  format: {with: /\A(?!選択してください)/ , message: "を選択してください"}
end
