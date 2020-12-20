class Customer::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @genres = Genre.all
    @items = Item.where(item_status: true).page(params[:page]).per(8)
  end

  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value)
  end

  def show
    @items = Item.where(item_status: true).page(params[:page]).per(8).revers_order 
    @item = Item.find(params[:id])
    @into_cart = IntoCart.new
  end

 private
 
 def search_for(how, value)
    case how                    
    when 'match'              
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
 end
end 