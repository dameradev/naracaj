class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def edit

  end

  def update
    @current_address = Address.find(params[:user][:address_id])
    @user.address = @current_address.title
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to checkout_path, notice: 'Address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(addresses_attributes: [:id, :title, :_destroy])
  end

end
