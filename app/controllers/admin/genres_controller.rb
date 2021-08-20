class Admin::GenresController < ApplicationController
  before_action :admin_signin, only: [:edit, :update]
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    if admin_signed_in?
      @genre = Genre.new(genre_params)
      if @genre.save
        redirect_to request.referer
      else
        @genre = Genre.new
        @genres = Genre.all
        render :index
      end
    else
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def admin_signin
    if admin_signed_in?
      @genre = Genre.find(params[:id])
    else
      redirect_to request.referer
    end
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
