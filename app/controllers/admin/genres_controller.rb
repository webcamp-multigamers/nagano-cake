class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer
    else
      @genre = Genre.new
      @genres = Genre.all
      render :index
    end
  end

  def edit
  end

  def uprate
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
