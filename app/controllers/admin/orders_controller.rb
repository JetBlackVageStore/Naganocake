class Admin::OrdersController < ApplicationController

  PER = 10

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
    @items = order.items.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path
    else
      flash.now[:alert] = "更新に失敗しました。"
      render "show"
    end
  end
end
