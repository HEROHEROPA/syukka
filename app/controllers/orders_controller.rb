class OrdersController < ApplicationController

def index
  @order = Order.new
end

def create
  @order = Order.new(get_order)
  @stocks = Stock.all
  
  if @order

    @stock_id =''
    @stock_amount = ''
   @stocks.each do |stock|
    if @order.order_number == stock.item_number
     @stock_id = stock.id
    end
   end
   @stock = Stock.find(@stock_id)
   stock_amount = @stock.stock_amount - @order.order_amount
 
   if stock_amount<0
    @order.save
   else
    @order.save
   end 

  else
   render "order#index"
  end 
  redirect_to order_stocks_path(@order.id)
end

def destroy
   @order = Order.find(params[:id])
   @order.destroy
   redirect_to root_path
end  



private

def get_order
  params.require(:order).permit(:order_number ,:order_amount)
end


end