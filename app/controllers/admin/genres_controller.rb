class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre.params)
    if @genre.save
      redirect_to admin_genre_path
    else
      @genres = Genre.all
      render "index"
    end
  end

  def show
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre.params)
      redirect_to admin_genre_path
    else
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :genre_status)
  end
end
