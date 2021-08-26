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
    @item = Item.find(params[:id])
    cart_in_count = @item.cart_items.count
    order_count = @item.order_items.count
    @genres = Genre.all
    @cart_item = CartItem.new

    if order_count >= 1 && cart_in_count >= 1
      flash.now[:notice] = "この商品は、#{cart_in_count}人が購入予定で、#{order_count}回注文がありました！"
    elsif order_count >= 1
      flash.now[:notice] = "この商品は、#{order_count}回注文がありました！"
    elsif cart_in_count >= 1
      flash.now[:notice] = "この商品は、#{cart_in_count}人が購入予定です！"
    end
  end
end
