class ShoppingCart

  delegate :sub_total, to: :order
  delegate :quantity, to: :order_item


  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart', user: nil) do |order|
      order.sub_total = 0
    end
  end
  def order_item
    @order_item ||= OrderItem.find_or_create_by(quantity:0) do |order|
      order.quantity = 0
    end
  end



  def items_count
    order.items.sum(:quantity)
  end


  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)


    order_item = order.items.find_or_initialize_by(
      product_id: product_id
    )

    order_item.price = product.price
    if order_item.quantity == nil
      order_item.quantity = quantity
    else
      order_item.quantity += quantity.to_i
    end
    ActiveRecord::Base.transaction do
      order_item.save
      update_sub_total
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_sub_total
    end
  end



  private

  def update_sub_total
    order.sub_total = order.items.sum('quantity * price')
    order.save
  end
  def update_order_quantity

  end

end
