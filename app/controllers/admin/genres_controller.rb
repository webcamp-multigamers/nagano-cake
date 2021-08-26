class Admin::GenresController < ApplicationController
  before_action :admin_not_signin

  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの作成に成功しました！"
      redirect_to request.referer
    else
      flash.now[:alert] = "ジャンルの名前を入力してください！"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの変更に成功しました！"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンルの名前を入力してください！"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
