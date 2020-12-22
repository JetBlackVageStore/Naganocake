class Admin::OrdersItemsController < ApplicationController

  def update
<<<<<<< HEAD
    prod_status = Order.find(params[:id])
    prod_status.update(prod_status_params)
    redirect_to admin_order_path(order.id)
=======
    order_item = OrderItem.find(params[:id])
    order = Order.find_by(id: order_item.order_id)
    order_item = order.order_items
    order_item.update(order_item_params)


    if order_item.prod_status == "製作中"
      order.update(status: "製作中")
    elsif order_items.all?{|op| op.prod_status == "製作完了"}
      order.update(status: "発送準備中")
    end
    redirect_to admin_order_path(order_item.order)
>>>>>>> 8876049db369ffaa1fda415394f53c2275b4ef36
  end

  private

  def order_item_params
    params.require(:order_product).permit(:making_status)
  end

end
