class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.order_quantity = cart.quantity
        order_item.price = cart.item.taxin_price
        order_item.order_id = @order.id
        order_item.item_id = cart.item_id
        order_item.save
      end
      redirect_to thanks_orders_path
      current_customer.cart_items.destroy_all
    else
      render :new
    end
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = "#{current_customer.first_name}#{current_customer.last_name}"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_number] == "2"
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
      @order.postal_code = Address.find(params[:order][:registered]).postal_code
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    else
      flash.now[:alert] = "情報を選択、入力してください。"
      render :new
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment, :postage, :order_status, :total_price)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end

end
