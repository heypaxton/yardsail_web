class SalesController < ApplicationController
  def index
    "Hello index"  
  end
  def new
    @sale = Sale.new    
  end

  def show
    @sale = Sale.find_by_id(params[:id]) 
  end

  def create
   @sale = Sale.create(params_for_sale)
   if @sale.save
     redirect_to @sale, notice: 'Your sale has been posted'
   else
     render 'new'
   end
  end

  def params_for_sale
   params.require(:sale).permit(:sale_type, :sale_date, :address, :city, :state, :zip, :description)
  end
end
