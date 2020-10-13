FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"test@test.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
  end

end