class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(@order)
  end
  
  def update
  end
  
end
