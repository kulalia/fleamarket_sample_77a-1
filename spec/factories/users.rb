FactoryBot.define do
  # 仮置き

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
  end

  # factory :user_with_user_profile, class: User do
  #   first_name         {"苗字"}
  #   first_name_kana    {"みょうじ"}
  #   family_name        {"名前"}
  #   family_name_kana   {"なまえ"}
  #   birthday           {"2000-02-02"}

  #   after( :create ) do |user|
  #     create :user_profile, user: user
  #   end
  # end
end