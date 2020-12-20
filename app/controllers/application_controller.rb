class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :firstname, :surname_kana, :firstname_kana, :postal_code, :address, :phone_number])
  end

  #admiｎとcustomerで分ける
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root
    end
  end

  #ログアウト時に遷移変更
  def after_sign_out_path_for(resource)
    root_path
  end
end
