class Customer::AddDeliveriesController < ApplicationController

  def index
   @add_delivery = AddDelivery.new
   @add_deliveries = current_customer.add_deliveries
  end

  def create
    @add_delivery = AddDelivery.new(add_delivery_params)
    @add_delivery.customer_id = current_customer.id
    if @add_delivery.save
      flash.now[:notice] = "新規配送先を登録しました"
      redirect_to add_deliveries_path
    else
      render "edit"
    end
  end

  def destroy
    @add_delivery = AddDelivery.find(params[:id])
    @add_delivery.save
    @add_deliveries = current_customer.add_deliveries
    flash.now[:alert] = "配送先を削除しました"
    redirect_to add_deliveries_path
  end

  def edit
  end

  def update
  end

  private

  def add_delivery_params
  	params.require(:add_delivery).permit(:postal_code, :address, :addressee)
  end
end
