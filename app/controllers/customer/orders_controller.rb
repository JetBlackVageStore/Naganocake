class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @add_deliveries = AddDelivery.where(customer: current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save
      @cart_items = IntoCart.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item.id
        @order_item.quantity = cart_item.quantity
        @order_item.save
        cart_item.destroy
      end
    end
    redirect_to completion_orders_path
  end

  def completion
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order("id DESC").page(params[:page]).per(10)
    @order_items = OrderItem.all
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

    @into_carts = IntoCart.where(customer_id: current_customer.id).includes(:item)
    @sum = 0
    @into_carts.each do |cart|
      cart.quantity = cart.quantity.to_i
      price = cart.item.price_without.to_i
      @sum += ( price * cart.quantity )
    end

  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :addressee, :payjp_id, :payment, :surname, :firstname)
  end

end
