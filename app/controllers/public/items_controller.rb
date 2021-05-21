class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
    @items_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
