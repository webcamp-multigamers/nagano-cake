class Admin::HomesController < ApplicationController
  before_action :admin_not_signin

	def top
	  @orders = Order.all
	end
end
