class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @add_deliveries = AddDelivery.where(customer: current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items



  end

  def create

    @into_carts = IntoCart.where(customer_id: current_customer.id).includes(:item)
    @sum = 0
    @into_carts.each do |cart|
      price = cart.item.price_without.to_i
      @sum = @sum + ( price*cart.quantity )
    end

    @charge = 800
    @order_status = 0

    @order = Order.where(customer_id: current_customer.id)
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to completion_orders_path

  end

  def completion
    # 注文完了後カート空
    @into_carts = current_customer.into_carts
    @into_carts.destroy_all
  end

  def index
    @order = Order.where(customer_id: current_customer)
    @orders = @order.all
    # @orders = current_customer.orders
    @into_carts = IntoCart.where(customer_id: current_customer.id).includes(:item)
    @sum = 0
    @into_carts.each do |cart|
      price = cart.item.price_without.to_i
      @sum = @sum + ( price*cart.quantity )
    end
  end

  def about
    @order = current_customer.orders.new(order_params)
    @into_carts = IntoCart.where(customer: current_customer)
    @order = Order.new(order_params)

    @add_deliveries = AddDelivery.where(customer: current_customer)
    #@into_carts = IntoCart.all
    if params[:order][:post] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.addressee = current_customer.surname +
                        current_customer.firstname

    elsif params[:order][:post] == "add_deliveries"
      name = AddDelivery.find(params[:order][:add_delivery_id])
      @order.postal_code = name.postal_code
      @order.address = name.address
      @order.addressee = name.addressee

    elsif params[:post] == "new_address"
      @order = AddDelivery.new
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.addressee = params[:order][:addressee]
      @order.save
    end

    @sum = 0
    @into_carts.each do |cart|
      cart.quantity = cart.quantity.to_i
      price = cart.item.price_without.to_i
      @sum = @sum +  ( price * cart.quantity )
    end



  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :addressee, :payjp_id, :payment, :surname, :firstname)
  end

end
