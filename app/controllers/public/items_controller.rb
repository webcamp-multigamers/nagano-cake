class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @search_word = params[:search_word]
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
      @quantity = Item.where(genre_id: params[:genre_id]).count
      @genre = Genre.find(params[:genre_id])
    elsif params[:search_word]
      @items = Item.where("name Like ?", "%" + @search_word + "%").page(params[:page]).per(8)
      @quantity = Item.where("name Like ?", "%" + @search_word + "%").count
    else
      @items = Item.page(params[:page]).per(8)
      @quantity = Item.count
    end
  end
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
