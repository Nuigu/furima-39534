FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    birthday              {Faker::Date.between(from: '1930-01-01', to:'2018-12-31')}
    last_name             {"三毛"}
    first_name            {"根子"}
    last_name_kana        {"ミケ"}
    first_name_kana       {"ネコ"}
  end
end