class ProductsController < ApplicationController

  def index
    @firm = Firm.find(params[:firm_id])
    @products = @firm.products.includes(:variants).order(:title)
    
  end

end
