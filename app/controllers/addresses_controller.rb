class AddressesController < ApplicationController
  def new_address

    respond_to do |format|
        format.html
        format.js
     end
  end

  private
  def address_params
    params.require(:address).permit(:address)
  end
end
