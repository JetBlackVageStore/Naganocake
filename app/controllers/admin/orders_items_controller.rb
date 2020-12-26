class Admin::OrdersItemsController < ApplicationController



      def update
        @order_item = OrderItem.find(params[:id])
        @order_item.update(order_item_params)
        @order = @order_item.order
        @order_items = @order.order_items

        if @order_items.pluck(:prod_status).all?{|prod_status| prod_status == '製作完了'}
          @order.update(order_status: '発送待ち')
        else
          @order_items.where(prod_status: '製作中').any?
          @order.update(order_status: '製作中')
        end

        if @order_item.update(order_item_params)
          redirect_to admin_order_path(@order_item.order)
        else
          render "show"
        end
      end

  private

      def order_item_params
        params.require(:order_item).permit(:order_id, :prod_status)
      end
  

end
