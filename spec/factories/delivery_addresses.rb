FactoryBot.define do
  # 仮置き

  factory :delivery_address do
    user
    first_name         {"苗字"}
    first_name_kana    {"みょうじ"}
    family_name        {"名前"}
    family_name_kana   {"なまえ"}
    postal_code        {"1234567"}
    prefecture_id      {"1"}
    city               {"大阪市中央区"}
    address            {"1-1-1"}
    building           {"マンション名101号室"}
    phone_number       {"1234567890"}
  end

end