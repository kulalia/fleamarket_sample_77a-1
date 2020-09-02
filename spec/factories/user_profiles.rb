FactoryBot.define do
  # 仮置き

  factory :user_profile do
    user
    first_name         {"苗字"}
    first_name_kana    {"みょうじ"}
    family_name        {"名前"}
    family_name_kana   {"なまえ"}
    birthday           {"2000-02-02"}
  end

end