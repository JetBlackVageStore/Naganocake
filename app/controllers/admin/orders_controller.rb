class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.order("id DESC").page(params[:page]).per(10)
    @order_items = OrderItem.all
  end
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == 1
      @order_items = OrderItem.all
      @order_items.each do |order_item|
        order_item.update(prod_status: 1) if @order.id == order_item.order_id
      end
    end
    redirect_to admin_order_path(@order)
  end
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
