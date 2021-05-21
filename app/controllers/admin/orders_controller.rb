class Admin::OrdersController < ApplicationController

  def show
    @tax = 1.1
    sum = 0
    @shipping = 800
    @order = Order.find(params[:id])
    @order_items = @order.order_items

    @order_items.each do |oi|
      sum += (oi.price * @tax).round(0)
    end

    @total_order_price = sum
    @total_payment = @total_order_price + @shipping

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :status, :postal_code, :address, :name, :method_payment, :shipping, :total_payment)
  end



end
