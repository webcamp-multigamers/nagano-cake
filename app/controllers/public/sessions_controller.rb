# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected

  # 退会済みのカスタマーが、ログインできないようにする処理
  # フラッシュメッセージが出力されないため、余裕があれば修正
    def rejuct_customer
      customer = Customer.fimd_by(email: params[:customer][:email].downcase)
      if customer
        if (customer.valid_password(params[:customer][:password]) && (user.active_for_authentication? == true))
          flash[:notice] = "このアカウントは退会済みです。アカウントを新規作成してください。"
          redirect_to new_cuatomer_session_path
        end
      end
    end

end
