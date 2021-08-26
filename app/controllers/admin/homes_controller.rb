class Admin::HomesController < ApplicationController
  before_action :admin_not_signin

	def top
		if params[:customer_id]
			@orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).per(10)
		else
			@orders = Order.all.page(params[:page]).per(10)
		end
	end
end
