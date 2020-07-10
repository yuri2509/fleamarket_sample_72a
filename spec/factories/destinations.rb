FactoryBot.define do

  factory :destination do
    family_name               {"山田"}
    first_name                {"太朗"}
    family_name_reading       {"ヤマダ"}
    first_name_reading        {"タロウ"}
    post_code                 {"1234567"}
    prefecture                {"愛知県:23"}
    city                      {"名古屋市"}
    address                   {"中区栄3-13-20"}
    building_name             {"栄センタービル3F"}
    phone_number              {"09010102020"}
  end

end