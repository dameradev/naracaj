class FirmsController < ApplicationController

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
    @firms = Firm.joins(:products).select('firms.*, count(products.id) as products_count').group('firms.id').order(:title)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_firm
    @firm = Firm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def firm_params
    params.require(:firm).permit(:title, product_categories_attributes:[ :id, product_attributes: [:id,:title, :price, :description]])
  end

end
