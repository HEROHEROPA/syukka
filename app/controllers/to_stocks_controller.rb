class ToStocksController < ApplicationController


  def index
    @to_stocks = ToStock.all.includes(:stock)
  end



  def create
    #binding.pry
  
   stock_id = ""
   config=Config.all
    config.each do |conf|
     if conf[:item_number]==params[:name]
       stock_id = conf[:id]
     end
    end   

   to_stock = ToStock.new(stock_id: stock_id, to_stock_amount: params[:amount])
   to_stock.save

   stock = Stock.find(to_stock.stock_id)#入庫商品在庫
   stock.stock_amount+=to_stock.to_stock_amount
   stock.save
   @stocks = Stock.all
   @order = Order.find(params[:order_id])

   @stocks.each do |stock|
    if stock.item_number==@order.order_number
      @stock = Stock.find(stock.id)#オーダー商品在庫  viewのモデルオプション指定に必要
    end
  end 
   render "/to_stocks/create.html.erb"
  end

#  private
  # def get_param
  #   params.require(:to_stock).permit(:stock_id params[:name],:to_stock_amount params[:amount])
  # end


end
