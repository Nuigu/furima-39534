FactoryBot.define do
  factory :order_form do
    postal_code       {"123-4567"}
    city              {"千代田区"}
    address           {"霞が関１－１－１"}
    building          {"法務省"}
    phone_number      {"00011112222"}
    prefecture_id     {13}
  end
end
