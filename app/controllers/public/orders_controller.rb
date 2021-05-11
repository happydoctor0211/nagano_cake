class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    # byebug
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    if params[:address_option] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.first_name
    elsif params[:address_option] == "1"
      @find_address = Address.find(params[:customer])
      @order.address = @find_address.address
      @order.postal_code =  @find_address.postal_code
      @order.name =  @find_address.name
    elsif params[:address_option] == "2"
      @order.address = params[:address]
      @order.postal_code = params[:postal_code]
      @order.address = params[:name]
    end

    if params[:method_payment] == "0"
      @method_payment = "クレジットカード"
    elsif params[:method_payment] == "1"
      @method_payment = "銀行振込"
    end

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to  orders_complete_path
  end

  def new
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :method_payment )
  end

end
