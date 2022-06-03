class ShippingsController < ApplicationController
 
  def index
    @shippings = Shipping.all
  end

  def create
   order = Order.find(params[:order_id]) 
   item = ""
   Config.all.each do |conf|
    if conf[:item_number]== order.order_number.to_s
     item = conf 
    end
   end 
     @shipping = Shipping.new(order_id: order.id,config_id: item[:id]) 
     @shipping.save
     redirect_to shippings_path
  end  

  
  def show
    @shipping = Shipping.find(params[:id])
    @item = ""
    @image = ""
    @confirm_point = ""
    Config.all.each do |conf|
      if  conf[:id]==@shipping.config_id
        @item = conf 
      end  
    end  
    @stocks = Stock.all
    @stocks.each do |stock|
      if stock.item_number == @item.item_number
       @image = stock.item_image
       @confirm_point = stock.confirm_point
      end
    end   
  end
 

 

end


