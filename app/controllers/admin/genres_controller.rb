class Admin::GenresController < ApplicationController


  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render "index"
    end
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name, :genre_status)
  end
end
