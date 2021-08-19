class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = @item.id
    unless @cart_item.save
      render "public/items/show"
    end
  end

  def update
    cart_item = CartItem.find(params[:item_id])
    if cart_item.customer_id == current_customer.id
      cart_item.update(cart_item_prams)
      redirect_to cart_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:item_id])
    if cart_item.customer_id == current_customer.id
      cart_item.destroy
      redirect_to cart_items_path
    end
  end

  def destroy_all
    current_customer.CartItem.destroy_all
  end

  private

  def cart_item_prams
    params.require(:cart_item).permit(:quantity)
  end

end
