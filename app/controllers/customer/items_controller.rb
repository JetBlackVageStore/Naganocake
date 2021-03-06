class Customer::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]

  def index
    @genres = Genre.all
    @items = Item.all
    @items_index = @items.where(item_status: true).page(params[:page]).per(8)
  end

  def search
    @datas=Item.where(genre_id: params[:search][:value])
  end

  def show
    @items = Item.where(item_status: true).page(params[:page]).per(8)
    @item = Item.find(params[:id])
    @into_cart = IntoCart.new
    @genres = Genre.all
  end


#   private

#   def match(value)
#     Item.where(name: value).or(Item.where(genre_id: value,))
#   end

#   def match(value)
#     Item.where(name:value).or(Item.where(genre_id: value, item_status: true))
#   end

#   def search_for(value)
#   case
#   when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
#       match(value)
#   when 'forward'
#       forward(value)
#   when 'backward'
#       backward(value)
#   when 'partical'
#       partical(value)
#   end
#   end
end
