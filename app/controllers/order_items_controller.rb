class OrderItemsController < ApplicationController


  def index
  @items = current_cart.order.items
  end
  def create

    @product = Product.find(params[:product_id])
    @firm = @product.firm
    unless current_user.is_a?(GuestUser)
      current_cart.add_item(
        product_id: params[:product_id],
        quantity: params[:quantity],
        )
       redirect_to firm_products_url(@firm)

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
