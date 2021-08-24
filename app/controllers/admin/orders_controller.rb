class Admin::OrdersController < ApplicationController
  before_action :admin_not_signin

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end
  def update
    order = Order.find(params[:id])
    order_item = OrderItem.find_by(order_id: order.id)

    if params[:order][:order_status] == "入金確認"
       order_item.update(create_status: "製作待ち")
    end
    order.update(order_params)
    redirect_to request.referer
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end