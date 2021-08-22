class Admin::OrdersController < ApplicationController
  before_action :admin_not_signin

  def show
    @order = Order.find(params[:id])

  end
  def update
    @order = Order.find(params[:id])
  end
end
