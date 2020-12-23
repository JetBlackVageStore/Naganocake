class Admin::OrdersItemsController < ApplicationController


    def update
      @order_item = OrderItem.find(params[:id])
      @order_item.prod_status = params[:status]
      @order_item.update(order_item_params)
      redirect_to request.referer
    end

  private

    def order_item_params
      params.require(:order_item).permit(:item_id, :order_id, :quantity, :price_with, :prod_status)
    end


end

