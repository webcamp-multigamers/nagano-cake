class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in
  

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "変更の保存に成功しました。"
      redirect_to customer_path
    else
      flash.now[:notice] = "情報は正しく入力してください"
      render "edit"
    end
  end

  def secession
    @customer = Customer.find(current_customer.id)
  end

  def secede
    @customer = Customer.find(current_customer.id)
    @customer.update(is_secede_frag: true)
    reset_session
    flash[:notice] = "退会処理を実行しました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  private
    def move_to_signed_in
      unless customer_signed_in?
        redirect_to new_customer_session_path
      end
    end

    def customer_params
      params.require(:customer).permit(:first_name,:last_name,
      :first_name_kana, :last_name_kana, :postal_code, :address,
      :telephone_number, :email)
    end
end
