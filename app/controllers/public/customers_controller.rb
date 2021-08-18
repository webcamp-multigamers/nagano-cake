class Public::CustomersController < ApplicationController

  def show
    @my = Customer.find(current_customer.id)
  end

  def edit
    @my = Customer.find(current_customer.id)
  end

end
