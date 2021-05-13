class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.shipping = 800
  end

  def confirm
    # byebug
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    @order.method_payment = params[:method_payment]
     @order.customer_id = current_customer.id
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
      @order.name = params[:name]
    end



  end

  def complete
  end

  def create
    sum = 0
    shipping = 800
    current_customer.cart_items.each {|ci| sum += (ci.amount * ci.item.price)}
    total_payment = (sum * 1.1).round(0) + shipping
    @order = Order.new(order_params)
    @order.shipping = shipping
    @order.total_payment = total_payment
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.destroy_all
      redirect_to  orders_complete_path
    elsif
      render :confirm
    end
  end

  def new
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :method_payment,:method_payment, :shipping, :total_payment )
  end

end
