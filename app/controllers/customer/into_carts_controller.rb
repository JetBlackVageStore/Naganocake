class Customer::IntoCartsController < ApplicationController
  def update
  end

  def index
   @into_carts = current_cart
   
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
