class Admin::OrdersController < ApplicationController
  before_action :admin_not_signin

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end
  def update
    binding.pry
    order = Order.find(params[:id])
    order_item = OrderItem.find_by(order_id: order.id)
    order.update(order_params)
    order_item.update(order_item_params)
    redirect_to request.referer
  #   if OrderItem.find_by(order_id: order.id).create_status == "2"
  #     order.order_status == "制作中"
  #     order.update
  # 	end
  
  end


  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_item_params
    params.require(:order).permit(:create_status)
  end
end