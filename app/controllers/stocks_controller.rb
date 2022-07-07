class StocksController < ApplicationController

  def index
   @stocks = Stock.all
   @order = Order.find(params[:order_id])
   @stock = ""
   @error = ""
   @stocks.each do |stock|
    if stock.item_number==@order.order_number
      @stock = Stock.find(stock.id)
    end
   end 
   @to_stock= @stock
  end
 

  def update 
   stock = Stock.find(params[:id])
   @order = Order.find(params[:order_id])
   r=''
   l=''
   configs = Config.all
   configs.each do |config|
    if config.item_number==stock.item_number && config[:attach]
       r=config[:attach][:r]
       l=config[:attach][:l]
    end 
   end
   
   @error =""

   if r=='' && l==''
    #zaiko = stock.stock_amount-@order.order_amount
    stock.stock_amount -= @order.order_amount
    zaiko = stock
    @stock3 = Stock.find(3)
   
     unless zaiko.valid?
       @error ="在庫不足です!"
     end  
   #   if stock.stock_amount < @stock3.stock_amount
    @stock= stock.update(item_number:stock.item_number,stock_amount:zaiko,item_image:stock.item_image,confirm_point:stock.confirm_point)
    @stock3.update(item_number:@stock3.item_number,stock_amount:zaiko,item_image:@stock3.item_image,confirm_point:@stock3.confirm_point)
    @stocks = Stock.all
    @shipping = Shipping.new
   elsif Stock.find(3).stock_amount>=@order.order_amount
      stock2 = Stock.find(r[:stock_id])
      stock3 = Stock.find(l[:stock_id])
      zaiko2 = stock2.stock_amount-r[:item_amount]*@order.order_amount#rはインスタンスでは無いのでインスタンス.メソッド名で値を取得できない。そのためハッシュのキー指定で値を取得する。
      zaiko3 = stock3.stock_amount-l[:item_amount]*@order.order_amount
      zaiko = stock.stock_amount-@order.order_amount
      @stock= stock.update(item_number:stock.item_number,stock_amount:zaiko,item_image:stock.item_image,confirm_point:stock.confirm_point)
      @stock2=stock2.update(item_number:r[:item_number],stock_amount:zaiko2,item_image:stock2.item_image,confirm_point:stock2.confirm_point)
      @stock3=stock3.update(item_number:l[:item_number],stock_amount:zaiko3,item_image:stock3.item_image,confirm_point:stock3.confirm_point)
      @stocks = Stock.all
      @shipping = Shipping.new 
   else 
      @error ="在庫不足です!"
      @stocks = Stock.all
      @shipping = Shipping.new
   end 
    #  render  "orders/index"
    @to_stock= stock
  end
   
   
   def back
    @stocks = Stock.all
    @shipping = Shipping.new
    @order = Order.find(params[:order_id])
    @to_stock = Stock.find(params[:id])
    
    if  @to_stock.stock_amount<@order.order_amount
      @error ="在庫不足です!"
    end  

    render "stocks/update.html.erb"
   end


   def currentstock
    @order = Order.find(params[:order_id])
    @shipping = Shipping.new
    @stocks = Stock.all
   end   


private
#  def update_stock
#    params.require(:stock).permit(:)
#  end

end
