class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
    #kaminari per（）が表示件数
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to admin_items_path
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find_by(id: @item.genre.id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to admin_items_path
    else
      render "edit"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:genre_id, :name, :specifcation, :price_without, :image_id, :item_status)
  end
end
