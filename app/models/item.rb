class Item < ApplicationRecord
  
  validates :name, presence: {message: "商品名を入力してください"}
  validates :detail, presence: {message: "商品の説明を入力してください"}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "販売価格は300円から9,999,999円の間に設定してください"}
  validates :category_id, presence: true, numericality: {greater_than: 1, message: "カテゴリーを選択してください"}
  validates :quality_id, presence: true, numericality: {greater_than: 1, message: "商品の状態を選択してください"}
  validates :delivery_cost_id, presence: true, numericality: {greater_than: 1, message: "配送料の負担を選択してください"}
  validates :prefecture_id, presence: true, numericality: {greater_than: 1, message: "発送元の地域を選択してください"}
  validates :delivery_time_id, presence: true, numericality: {greater_than: 1, message: "発送までの日数を選択してください"}
  validates :image, presence: {message: "商品の画像を選択してください"}

  # Associations
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_cost
  belongs_to :delivery_time
  belongs_to :prefecture
end
