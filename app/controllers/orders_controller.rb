class OrdersController < ApplicationController
  def new
    @order = current_cart.order

    @order.user = current_user
    @user = @order.user

  end

  def create
    @order = current_cart.order
    if @order.update_attributes(order_params.merge(status: 'open', user: current_user))
      session[:cart_token] = nil
      current_user.choose_address(address_id: params[:address_id])
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, user_attributes:[:address_id])
  end

end
