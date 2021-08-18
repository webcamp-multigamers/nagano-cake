class ApplicationController < ActionController::Base
  # アクションが行われる前に、サインインで以下の内容を用いることを許可しています。
  # last_name, first_nameなど
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先設定（未実装）
  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     # Adminログイン後の遷移先をpathで指定してください
  #   when Customer
  #     # Customerログイン後の遷移先をpathで指定してください
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,
    :first_name, :last_name_kana, :first_name_kana, :postal_code,
    :address, :telephone_number])
  end
end
