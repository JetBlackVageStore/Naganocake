class Admin::OrdersItemsController < ApplicationController

  def update
    prod_status = Order.find(params[:id])
    prod_status.update(prod_status_params)
    redirect_to admin_order_path(order.id)
  end
end
