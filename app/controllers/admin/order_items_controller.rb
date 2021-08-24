class Admin::OrderItemsController < ApplicationController
  def update

    order_item = OrderItem.find(params[:id])
    order = Order.find(order_item.order_id)
    order_items = OrderItem.where(order_id: order.id)

    order_item.update(order_item_params)
    if params[:order_item][:create_status] == "製作中"
      order.update(order_status: "製作中")
    elsif params[:order_item][:create_status] == "製作完了"
      # メソッドを使い、falseが帰らなかったらorder_statusを発送準備中に変更
      if all_check(order_items) == "まだ"
      else
        order.update(order_status: "発送準備中")
      end
    end
    order_item.update(order_item_params)
    redirect_to request.referer
  end

   # order_itemをすべて取り出し、その中に制作完了でないものが混ざっていたら”false”を返す処理
  def all_check(item)
    item.each do |f|
      if f.create_status == "製作完了"
      else
        return "まだ"
      end
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:create_status)
  end
end

