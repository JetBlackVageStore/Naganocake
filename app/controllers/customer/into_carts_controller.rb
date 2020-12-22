class Customer::IntoCartsController < ApplicationController
  def update
  end

  def index
   @carts_items = current_cart
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
