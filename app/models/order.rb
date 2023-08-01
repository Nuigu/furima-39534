class Order < ApplicationRecord
  include ActiveModel::Model

  # attr_accessor :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :token

  # バリデーション

  # Associations
  belongs_to :user
  belongs_to :item
  has_one :address

  # 処理
end
