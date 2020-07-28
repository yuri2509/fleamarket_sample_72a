FactoryBot.define do

  factory :item do
    name                  {"シャネルのバッグ 限定品"} # item.name = "~~~"
    description           {"こちらの商品は、昔から愛用しており、購入から10年経っております。"}
    price                 {300}
    brand                 {"シャネル"}
    status                {"新品、未使用"}
    prefecture_id         {3}
    day                   {"1〜2日で発送"}
    cost                  {"送料込み(出品者負担)"}
    trading_status        {1}
    association :user
    association :category
    images {[build(:image)]} #item.images = [build(:image)]
  end

end