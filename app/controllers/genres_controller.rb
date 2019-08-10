class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
    @category = Category.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      category = Category.create(name: "#{genre.name}全般", genre_id: genre.id)
      flash[:success] = "作成しました！"
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
