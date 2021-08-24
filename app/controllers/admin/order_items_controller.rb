class Admin::OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order = Order.find(order_item.order_id)

    if params[:order_item][:create_status] == "製作中"
      order.update(order_status: "製作中")
    elsif params[:order_item][:create_status] == "製作完了"
      order.update(order_status: "発送準備中")
    end
      order_item.update(order_item_params)
      flash[:notice] = "製作ステータスを更新しました！"
      redirect_to request.referer
  end

  private
  def order_item_params
    params.require(:order_item).permit(:create_status)
  end
end
