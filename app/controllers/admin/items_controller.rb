class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
    tax = 1.1
    @in_tax = (@item.price * tax).round(0)

  end

  def edit
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active, :created_at, :uodated_at)
  end
end
