class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


#https://qiita.com/IsakiMatsuo/items/4f72c65584c2c9892961
# それぞれのsession,registrationコントローラに記述

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,:email, :postal_code, :address, :telephone_number])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
