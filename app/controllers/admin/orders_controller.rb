class Admin::OrdersController < ApplicationController
  before_action :admin_not_signin

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end
  def update
    @order = Order.find(params[:id])
    @order_items = @order.order.items
    @order.update(order_params)
  end
end
