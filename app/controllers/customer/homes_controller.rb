class Customer::HomesController < ApplicationController

  RECOMMEND_ITEMS = 4

  def top
    @genres = Genre.all
    @items = Item.all
    @item = @items.sample(RECOMMEND_ITEMS)
  end

  def about
  end

end
