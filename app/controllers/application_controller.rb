class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :firstname, :surname_kana, :firstname_kana, :postal_code, :address, :phone_number])
  end

  def after_sign_in_path_for(resource)
    if current_customer
      flash[:notice] = "ログインに成功しました"
      items_path
    elsif admin_signed_in?
      flash[:notice] = "ログインに成功しました"
      root_path
    else
      render "/customers/sign_up"
    end
  end

  #ログアウト時に遷移変更
  def after_sign_out_path_for(resource)
    root_path
  end
end
