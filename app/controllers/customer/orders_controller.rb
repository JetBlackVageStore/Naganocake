  class Customer::OrdersController < ApplicationController
     before_action :authenticate_customer!

     def new
       @order = Order.new
       @add_deliveries = AddDelivery.where(customer: current_customer)
     end

     def show
       @order = Order.find(params[:id])
       @order_products = @order.order_items
     end

     def create
       
       @order = Order.new(order_params)
       @order.customer_id = current_customer.id
       
       if @order.save
         @into_carts = current_customer.cart_items
         @into_carts.each do |cart|
           order_item = @order.order_items.new
           order_item.item_id = cart.item_id
           order_item.quantity = cart.quantity
           order_item.price_with = cart.product.price_with
           order_item.order_id = @order.id

           order_item.save
         end
         @order.update(status: "入金待ち")

         unless current_customer.deliveries.find_by(postal_code: @order.postal_code, address: @order.address, addressee: @order.addressee).present?
           @delivery = AddDelivery.new
           @delivery.customer_id = current_customer.id
           @delivery.postal_code = @order.postal_code
           @delivery.address = @order.address
           @delivery.addressee = @order.addressee
           @delivery.save
         end
         redirect_to orders_path
       else
         @orders = Order.all
         render 'about'
       end
       
     end

     def completion
     end

     def index
       @orders = Order.all
     end

     def confirm
     end

     def about
       # @order = current_customer.orders.new(order_params)
       # @order.save
       # @into_carts = IntoCart.all
       @order = Order.new(order_params)
       #@order.save
       @add_deliveries = AddDelivery.where(customer: current_customer)
       @into_carts = IntoCart.where(customer: current_customer)
       if params[:order][:address_type] == "A"
         #自分の登録済みの住所(ユーザーモデルの住所)
         @order.postal_code = current_customer.postal_code
         @order.address = current_customer.address
         @order.addressee = current_customer.surname + current_customer.firstname

       elsif params[:order][:post] = "add_deliveries"
         name = AddDelivery.find(params[:order][:add_delivery_id])
         @order.postal_code = name.postal_code
         @order.address = name.address
         @order.addressee = name.addressee

       elsif params[:order][:post] = "new_address"
         @order.postal_code = params[:order][:postal_code]
         @order.address = params[:order][:address]
         @order.addressee = params[:order][:addressee]
       elsif params[:order] = "params_inuput"
       end
     end
  
     private
     def order_params
       params.require(:order).permit(:postal_code, :address, :addressee, :payjp_id, :payment, :surname, :firstname)
     end
  end