FactoryBot.define do
  factory :image, class: Image do
    src  {File.open("#{Rails.root}/app/assets/images/sample.fish.png")}
  end
end