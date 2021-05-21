# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # https://qiita.com/yuto_1014/items/358d0a425193b12c969aを参照
  before_action :reject_customer, only: [:create]

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
  
  def after_sign_in_path_for(resource)
     customers_my_page_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

   def reject_customer
     @customer = Customer.find_by(email: params[:customer][:email].downcase)
      if @customer
       if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
         flash[:error] = "退会済みです。"
         redirect_to new_customer_session_path
       end
      else
         flash[:error] = "必須項目を入力してください。"
      end
   end
end
