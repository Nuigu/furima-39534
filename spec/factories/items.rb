FactoryBot.define do
  factory :item do
    name             {'サンプル'}
    detail           {'説明文'}
    price            {Faker::Number.between(from: 300, to: 9999999)}
    category_id      {Faker::Number.between(from: 2, to: 11)}
    quality_id       {Faker::Number.between(from: 2, to: 7)}
    delivery_cost_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    delivery_time_id {Faker::Number.between(from: 2, to: 4)}
    association      :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
