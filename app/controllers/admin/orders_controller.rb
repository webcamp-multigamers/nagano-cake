class Admin::OrdersController < ApplicationController
  before_action :admin_not_signin

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end
  def update
    order = Order.find(params[:id])
    #　１件の情報を取り出すfind_byではなく、対応するレコードすべて取り出すwhereに変更
    order_item = OrderItem.where(order_id: order.id)
    # 11行で取り出した情報すべてに変更を実施するためにeachを使用
    order_item.each do
      if params[:order][:order_status] == "入金確認"
        order_item.update(create_status: "製作待ち")
      end
    order.update(order_params)
    end
    redirect_to request.referer
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end