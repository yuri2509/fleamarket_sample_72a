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
    sentaku:0,
    sinpin:1,
    misiyou:2,
    yogorenasi:3,
    yayakizuari:4,
    kizuari:5,
    zyoutaigawarui:6,
  }, _prefix:true
  validates :status,
  format: {with: /\A(?!選択してください)/ , message: "を選択してください"}

  # 出品状況
  enum trading_status: {
    sentaku:0,
    syuppintyu:1,
    baikyakuzumi:2,
  }

  # 配送料の負担
  enum cost: {
    sentaku:0,
    souryoukomi:1,
    tyakubarai:2,
  }, _prefix:true
  validates :cost,
  format: {with: /\A(?!選択してください)/ , message: "を選択してください"}

  # 発送までの日数
  enum day: {
    sentaku:0,
    itiniti:1,
    futuka:2,
    yokka:3,
  }, _prefix:true
  validates :day,
  format: {with: /\A(?!選択してください)/ , message: "を選択してください"}
end
