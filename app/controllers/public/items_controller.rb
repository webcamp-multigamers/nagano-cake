class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
      @quantity = Item.where(genre_id: params[:genre_id]).count
      @genre = Genre.find(params[:genre_id])
    else
      @items = Item.page(params[:page]).per(8)
      @quantity = Item.count
    end
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
