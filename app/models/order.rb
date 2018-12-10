class Order < ApplicationRecord

  has_many :items, class_name: 'OrderItem'
  belongs_to :user ,optional:true
  def quantity
    order.items.quantity
  end
end
