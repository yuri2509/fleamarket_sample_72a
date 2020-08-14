FactoryBot.define do

  factory :item do
    name                  {"シャネルのバッグ 限定品"}
    description           {"こちらの商品は、昔から愛用しており、購入から10年経っております。"}
    price                 {300}
    brand                 {"シャネル"}
    status                {"sinpin"}
    prefecture_id         {3}
    day                   {"itiniti"}
    cost                  {"souryoukomi"}
    trading_status        {1}
    association :user
    association :category
    images {[build(:image)]}
  end

end