class Customer::IntoCartsController < ApplicationController
   # before_action :setup_cart_item!, only: [:create, :update, :destroy, :destroy_all]

   def index
    @cart_items = IntoCart.where(customer_id: current_customer.id).includes(:item)

    @sum = 0
    @cart_items.each do |cart_item|
     quantity = cart_item.quantity.to_i
     price = cart_item.item.price_without.to_i
     @sum = @sum + ( price*quantity )
    end
     # @price = IntoCart.find_by(pramas[:item_id])
     # @toral_price = item.sum(:price_without)

   end



   def destroy
     cart_item = IntoCart.find(params[:id])
     cart_item.destroy
     redirect_to into_carts_path
   end

   def delete_all
     cart_items = IntoCart.where(customer_id: current_customer.id)
     # delete_all??desteoy_all??
     cart_items.delete_all
     redirect_to request.referer
     # 要リダイレクト先設定
     redirect_back request.referer
   end

   def create
    # if IntoCart.where(customer_id: current_customer.id).find_by(item_id: params[:into_cart][:item_id]).blank?
    if IntoCart.find_by(item_id: params[:into_cart][:item_id], customer_id: current_customer.id).blank?
    cart = IntoCart.new
    cart.customer_id=current_customer.id
    cart.item_id=params[:into_cart][:item_id]
    cart.quantity=params[:into_cart][:quantity]
    cart.save
    else
     cart=IntoCart.find_by(customer_id: current_customer.id, item_id: params[:into_cart][:item_id])
     cart.quantity += params[:into_cart][:quantity].to_i
     cart.save

    end
    redirect_to into_carts_path
   end


   def update
     new_quantity = params[:into_cart][:quantity].to_i
     cart = IntoCart.find(params[:id])
     cart.update(quantity: new_quantity)
     redirect_to into_carts_path
   end

  private
   def setup_cart_item!
     @cart_item = current_cart.items.find_by(item_id: params[:item_id])
   end

end


