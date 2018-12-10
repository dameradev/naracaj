class OrderItemsController < ApplicationController
  def index
  @items = current_cart.order.items

end
 def create
   @product = Product.find(params[:product_id])
   @firm = @product.firm
   unless current_user.is_a?(GuestUser)

     if current_cart.order.items.count(:quantity) < 0
      current_cart.add_item(
        product_id: params[:product_id],
        quantity: params[:quantity],

      )
       redirect_to firm_products_url(@firm)
     elsif current_cart.order_items > 0
        quan = current_cart.order.items.count(:quantity)
       current_cart.add_item(
         product_id: params[:product_id],
         quantity: quan = quan + params[:quantity].to_i
       )
       redirect_to firm_products_url(@firm)
      end
   else
     redirect_to new_user_session_path
     flash[:notice] = "You must be logged in!"
   end
end
 def destroy
  current_cart.remove_item(id: params[:id])
  redirect_to cart_path
  end
end
