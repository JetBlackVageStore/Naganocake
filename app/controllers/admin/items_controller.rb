class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!
  def new
    @item = Item.new
  end
  def index
    @items = Item.all.page(params[:page]).per(10)
  end


  def show
    @item = Item.find(params[:id])
    @genre = Genre.find_by(id: @item.genre_id)
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render 'new'
    end
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to admin_item_path(@item)
    else
      render 'edit'
    end
  end

  private

  def items_params
    params.require(:item).permit( :genre_id, :name, :specifcation, :price_without, :image, :item_status)
  end
end
