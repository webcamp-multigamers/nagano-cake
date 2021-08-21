class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to check_orders_path
    else
      render :new
    end
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = order.find(params[:id])
  end

  def check
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment)
  end
end
