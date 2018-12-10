class FirmsController < ApplicationController
  before_action :set_firm, only: [:edit, :show, :update, :destroy]


  def new
    @firm = Firm.new

  end

  def create
    @firm = Firm.new(firm_params)

    respond_to do |format|
      if @firm.save
        format.html { redirect_to firms_path, notice: 'Firm item is now live.' }

      else
        format.html { render :new }
      end
    end
  end

  def index
    @firms = Firm.all.order(:title)
  end

  def destroy
  @firm.destroy
  respond_to do |format|
    format.html { redirect_to firms_url, notice: 'Firm item was deleted' }
  end
end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_firm
    @firm = Firm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def firm_params
    params.require(:firm).permit(:title, products_attributes: [:id, :title, :price, :description, :category_id, :_destroy])
  end

end
