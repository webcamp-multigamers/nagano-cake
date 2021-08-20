class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @oder.save
      redirect_to orders_check
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
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_integer)
  end
end
