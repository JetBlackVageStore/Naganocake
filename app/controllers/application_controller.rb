class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

<<<<<<< HEAD
  #ログイン時に下記のカラム入力を許可
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :firstname, :surname_kana, :firstname_kana, :postal_code, :address, :phone_number] )
  end

  # ログイン時に遷移変更
=======
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :firstname, :surname_kana, :firstname_kana, :postal_code, :address, :phone_number])
  end

>>>>>>> 10ee55873ca8aecb4d8cb5c9b255283aa946a3be
  def after_sign_in_path_for(resource)
      if current_customer
        flash[:notice] = "ログインに成功しました"
        items_path
      else
        render "/customers/sign_up"
      end
<<<<<<< HEAD
  end

  #ログアウト時に遷移変更
  def after_sign_out_path_for(resource)
    root_path
=======
>>>>>>> 10ee55873ca8aecb4d8cb5c9b255283aa946a3be
  end
end
