class Admin::OrderItemsController < ApplicationController

  def update
     @order_item = OrderItem.find(params[:id])
     @order_item.update(order_item_params)
     @order = @order_item.order
     if @order_item.making_status == "making"
        @order.update(status:2)
     end


     @order_items = @order.order_items
     count = 0
     @order_items.each do |order_item|
        if order_item.making_status == "made"
          count += 1
        end
     end

     if count == @order_items.count
       @order.update(status:3)
     end

     redirect_to admin_order_path(@order_item.order)

  end


  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
