class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新しい宛先を作成しました！"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses.all
      flash.now[:alert] = "情報を正しく入力してください！"
      render "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def destroy
    address = Address.find(params[:id])
    if address.customer_id == current_customer.id
      address.destroy
      flash[:notice] = "アドレスを削除しました！"
      redirect_to addresses_path
    else
      flash[:alert] = "削除に失敗しました！"
      redirect_to addresses_path
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "アドレス情報を更新しました！"
      redirect_to addresses_path
    else
      flash.now[:alert] = "情報を正しく入力してください！"
      render "edit"
    end
  end


  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
