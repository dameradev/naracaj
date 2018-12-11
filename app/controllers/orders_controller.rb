class OrdersController < ApplicationController
  def new
    @order = current_cart.order

    @order.user = current_user

  end

  def create
    @order = current_cart.order

    @order.address = params[:order][:user][:address_id]
    if @order.update_attributes(order_params.merge(status: 'open', user: current_user))
      session[:cart_token] = nil
      # address_id: params[:order][:user][:address_id]
      redirect_to root_path
      binding.pry
    else
      render :new
    end

  end

  




  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit( user_attributes:[:address_id])
  end

end
