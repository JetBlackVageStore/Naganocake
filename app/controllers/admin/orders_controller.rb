class Admin::OrdersController < ApplicationController

  PER = 10

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items.all
  end

  def update
  end
end
