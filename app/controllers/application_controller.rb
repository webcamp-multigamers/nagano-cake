class ApplicationController < ActionController::Base
  # アクションが行われる前に、サインインで以下の内容を用いることを許可しています。
  # last_name, first_nameなど
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      customer_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,
    :first_name, :last_name_kana, :first_name_kana, :postal_code,
    :address, :telephone_number])
  end

  def admin_not_signin
    unless admin_signed_in?
      redirect_to root_path
    end
  end

end
