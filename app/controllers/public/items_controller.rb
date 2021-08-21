class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @quantity = Item.count
    @genres = Genre.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
