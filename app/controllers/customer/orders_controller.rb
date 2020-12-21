class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @add_deliveries = AddDelivery.where(customer: current_customer)
  end

  def show
  end

  def create
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
     @into_carts = IntoCart.all
     if params[:order][:post] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.addressee = current_customer.surname +
                         current_customer.firstname

     elsif params[:order][:post] = "add_deliveries"
      name = AddDelivery.find(params[:order][:add_delivery_id])
      @order.postal_code = name.postal_code
      @order.address = name.address
      @order.addressee = name.addressee

     elsif params[:order][:name]= "new_address"
       name = current_customer.add_deliveries.find(params[:order])
       @order.postal_code = name.postal_code
       @order.address = name.address
       @order.addressee = name.addressee
     elsif params[:order] = "params_inuput"
     end
  end
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :addressee, :payjp_id, :payment, :surname, :firstname)
  end

end