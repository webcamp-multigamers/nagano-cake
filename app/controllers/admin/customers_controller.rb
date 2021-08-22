class Admin::CustomersController < ApplicationController
  before_action :admin_not_signin
  
	def index
		@customers = Customer.page(params[:page]).per(10)
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to admin_customer_path(@customer.id)
		else
			render :edit
		end
	end

	private

	def customer_params
		params.require(:customer).permit(
			:first_name, :first_name_kana,
			:last_name, :last_name_kana,
			:postal_code, :address,
			:telephone_number, :email,
			:is_secede_frag
			)
	end
end
