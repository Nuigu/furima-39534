class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :token

  with_options presence: {message: "を入力してください"} do
    validates :user_id, :item_id, :city, :address
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "'000-0000'の形式で入力してください"}
    validates :phone_number, numericality: {only_integer: true, message: "半角数字のみで入力してください"}, length: {in: 10..11, message: "桁数を確認してください"}
    validates :prefecture_id, numericality: {greater_than: 1, message: "を選択してください"}
  end

  validates :token, presence: {message: "を正しく入力してください"}

  def save
    return false if invalid?
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end