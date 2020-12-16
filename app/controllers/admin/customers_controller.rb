class Admin::CustomersController < ApplicationController
  # before_action :authenticate_user!
  # ログイン済のユーザのみアクセスの許可をする
  
  # アクションが足りていない気がする
  # カラム 追加、isdelete?系のブーリアンがた
  def index
    @customers = User.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customers_params)
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

    private

  def customers_params
    # permit以下、key取得、update用
    params.require(:customer).permit(:surname, :firstname, :surname_kana, :firstname_kana,:postal_code,:address,:phone_number,:encrypted_password)
  end

end
