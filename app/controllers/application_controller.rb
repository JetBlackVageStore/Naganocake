class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  include ErrorHandlers if Rails.env.production?
  #ログイン時に下記のカラム入力を許可
  #
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[surname firstname surname_kana firstname_kana postal_code address phone_number] )
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if session[:into_cart_id]
      @cart = IntoCart.find(session[:into_cart_id])
    else
      @cart = IntoCart.create
      session[:into_cart_id] = @cart.id
    end
  end

end
