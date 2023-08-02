class Order < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :item
  has_one :address

end
