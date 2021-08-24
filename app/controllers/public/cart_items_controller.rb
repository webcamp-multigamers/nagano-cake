class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      flash[:notice] = "商品をカートに入れました！"
      redirect_to request.referer
    else
      @item = Item.find(@cart_item.item_id)
      @genres = Genre.all
      flash.now[:alert] = "購入する個数を選択してください！"
      render "public/items/show"
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.customer_id == current_customer.id
      cart_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.customer_id == current_customer.id
      cart_item.destroy
      redirect_to request.referer
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
