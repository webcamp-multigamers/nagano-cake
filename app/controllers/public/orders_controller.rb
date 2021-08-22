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
    @order = Order.find(params[:id])
  end

  def check
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    @postage = 800
    @order = Order.new(order_params)
      if params[:order][:address_number] == "1"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name+current_customer.first_name
      elsif params[:order][:address_number] == "2"
        @order.postal_code = Address.find(params[:order][:address]).postal_code
        @order.address = Address.find(params[:order][:address]).address
        @order.name = Address.find(params[:order][:address]).name
      elsif params[:order][:address_number] == "3"
        @order.postal_code = params[:order][:postal_code]  
        @order.address = params[:order][:address] 
        @order.name = params[:order][:name]
      else
        render :new
      end
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment)
  end
end
