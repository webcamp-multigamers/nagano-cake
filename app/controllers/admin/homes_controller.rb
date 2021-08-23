class Admin::HomesController < ApplicationController
  before_action :admin_not_signin

	def top
	  @orders = Order.page(params[:page]).per(10)
	end
end
