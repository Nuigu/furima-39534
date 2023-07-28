class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, presence: true
  validates :quality_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true

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
