class Customer::CustomersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_customer!, only: [:edit, :update]
=======
  before_action :authenticate_customer!
>>>>>>> 10ee55873ca8aecb4d8cb5c9b255283aa946a3be
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer = current_customer
		if @customer.update(customer_params)
		  flash[:success] = "登録情報を変更しました"
		  redirect_to my_page_customers_path
		else
<<<<<<< HEAD
		  render :edit
=======
		  render "edit"
>>>>>>> 10ee55873ca8aecb4d8cb5c9b255283aa946a3be
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
