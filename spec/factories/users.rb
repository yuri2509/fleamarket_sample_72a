FactoryBot.define do

  factory :user do
    nickname            {"フリマ太朗"}
    email               {"tarou@gmail.com"}
    password            {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"山田"}
    first_name            {"太朗"}
    family_name_reading   {"ヤマダ"}
    first_name_reading    {"タロウ"}
    birth_day             {"1996-07-08"}
  end

end