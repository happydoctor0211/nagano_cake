class Public::CartItemsController < ApplicationController

   before_action :authenticate_customer!

  def index
    #@cart_items = CartItem.where(current_customer.id)
     @cart_items = current_customer.cart_items.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

   def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
   end

  def create
    #https://teratail.com/questions/234399を参照
    # https://teratail.com/questions/280481を参照
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save(cart_item_params)
      redirect_to cart_items_path

    else
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     @cart_item.save
     redirect_to cart_items_path

    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount )
  end

end
