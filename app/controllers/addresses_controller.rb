class AddressesController < ApplicationController

  def new
    @address = current_user.addresses.build

    respond_to do |format|
        format.html
        format.js
     end
  end

  def create

    @address = current_user.addresses.build(address_params)
    @address.save
    redirect_to checkout_path, notice: 'Firm item is now live.'


  end

  private
  def address_params
    params.require(:address).permit(:title)
  end
end
