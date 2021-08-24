class Admin::ItemsController < ApplicationController
  before_action :admin_not_signin

  def index
   @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品登録成功しました"
       redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item = ITem.find(params[:id])
    @item.save
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction,  :genre_id, :price, :is_sales_status)
  end

end
