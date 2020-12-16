class Customer::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @genres = Genre.all
  end

  def search
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @into_cart = IntoCart.new
  end
end
