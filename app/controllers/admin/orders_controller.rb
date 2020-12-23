class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @customer = Customer.find_by(id: @order.customer_id)
  end

  def update
    order = Order.find(params[:id])
    order_items = order.order_items
    order.update(order_params)

    if order.order_status == "入金確認"
      order_items.update_all(prod_status: "製作待ち")
    end
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end


end
