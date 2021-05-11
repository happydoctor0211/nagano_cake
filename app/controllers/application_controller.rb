class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

#https://qiita.com/IsakiMatsuo/items/4f72c65584c2c9892961
  def after_admin_sign_in_path_for(resource)
    case resources
    when Admin
     admin_items_pat
    when Customer
      items_path
    end
  end

   def after_admin_sign_up_path_for(resource)
    case resources
    when Admin
     admin_items_pat
    when Customer
      items_path
    end
   end

   def after_admin_sign_out_path_for(resource)
    case resources
    when Admin
     admin_root_pat
    when Customer
      root_path
    end
   end




  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,:email, :postal_code, :address, :telephone_number])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
