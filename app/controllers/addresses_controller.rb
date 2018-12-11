class AddressesController < ApplicationController

  def new
    @address = current_user.addresses.build
    binding.pry
    respond_to do |format|
        format.html
        format.js
     end
  end

  def create
    binding.pry
    @address = current_user.addresses.build(address_params)
    @address.save
    redirect_to cart_path, notice: 'Firm item is now live.'


  end

  private
  def address_params
    params.require(:address).permit(:title)
  end
end
