class Admin::OrdersItemsController < ApplicationController

    def update
      @order_item = OrderItem.find(params[:id])
      @order = Order.find(@order_item.order_id)
      @order_item.update(order_item_params)
      @order.update(order_status: 2 ) if @order_item.prod_status == 2
      @order_item_finds = OrderItem.where(order_id: @order.id)
      @order.update(order_status: 3 ) unless @order_item_finds.where(prod_status: 2).exists?

      redirect_to admin_order_path(@order_item.order_id)
    end

  private

    def order_item_params
      params.require(:order_item).permit(:order_id, :prod_status)
    end
  

end
