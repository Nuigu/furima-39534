class Item < ApplicationRecord
  
  validates :name, presence: {message: "を入力してください"}, length: {maximum: 40, message: "は40文字以内にしてください"}
  validates :detail, presence: {message: "を入力してください"}, length: {maximum: 1000, message: "は1,000文字以内にしてください"}
  validates :price, presence: {message: "を入力してください"}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: "は300円から9,999,999円の間に設定してください"}
  validates :category_id, presence: true, numericality: {greater_than: 1, message: "を選択してください"}
  validates :quality_id, presence: true, numericality: {greater_than: 1, message: "を選択してください"}
  validates :delivery_cost_id, presence: true, numericality: {greater_than: 1, message: "を選択してください"}
  validates :prefecture_id, presence: true, numericality: {greater_than: 1, message: "（発送元の地域）を選択してください"}
  validates :delivery_time_id, presence: true, numericality: {greater_than: 1, message: "を選択してください"}
  validates :image, presence: {message: "を選択してください"}

  # Associations
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_cost
  belongs_to :delivery_time
  belongs_to :prefecture
end
