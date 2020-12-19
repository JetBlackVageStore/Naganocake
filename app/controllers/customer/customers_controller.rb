class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:edit, :update]
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
		if @customer.update(customer_params)
		  flash[:success] = "登録情報を変更しました"
		  redirect_to my_page_customers_path
		else
		  render :edit
		end
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
    def customer_params
      params.require(:customer).permit(:surname, :firstname, :surname_kana, :firstname_kana, :postal_code, :email, :address, :phone_number )
    end

end
