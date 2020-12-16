class Customer::ItemsController < ApplicationController
  def index
    @genres = Genre.all
  end

  def search
  end

  def show
  end
end
