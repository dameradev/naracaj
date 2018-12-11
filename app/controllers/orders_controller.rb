class OrdersController < ApplicationController
  def new
    @order = current_cart.order

    @order.user = current_user
    @user = @order.user

  end

  def create
    @order = current_cart.order
    binding.pry
    @order.address = params[:order][:user][:address_id]
    if @order.update_attributes(order_params.merge(status: 'open', user: current_user))
      session[:cart_token] = nil
      # address_id: params[:order][:user][:address_id]
      redirect_to root_path
    else
      render :new
    end
    binding.pry
  end
  

  private

  def order_params
    params.require(:order).permit( user_attributes:[:address_id])
  end

end
