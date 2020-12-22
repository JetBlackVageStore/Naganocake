class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @add_deliveries = AddDelivery.where(customer: current_customer)
  end

  def show
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to completion_orders_path
  end

  def completion
  end

  def index
    @orders = Order.all
  end

  def about
    @order = current_customer.orders.new(order_params)
    # @order.save
    @into_carts = IntoCart.where(customer: current_customer)
    @order = Order.new(order_params)
    #@order.save
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
      
    end

     @total_price = 0
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :addressee, :payjp_id, :payment, :surname, :firstname)
  end

end