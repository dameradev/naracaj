class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy]
  def index
    @orders = Order.all
  end


  def new
    @order = current_cart.order

    @user = current_user
  end

  def create
    @order = current_cart.order

    
    if @order.update_attributes(order_params.merge(status: 'open', user: current_user))
      session[:cart_token] = nil
      # address_id: params[:order][:user][:address_id]
      redirect_to root_path

    else
      render :new
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order item was deleted' }
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
