class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
    @customer =  Customer.find(current_customer.id)
  end

  def update
    @customer =  Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to  customers_my_page_path
  end

  def confirm
  end

  def withdraw
    # https://qiita.com/yuto_1014/items/358d0a425193b12c969a
    @customer =  Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :postal_code, :address, :telephone_number )
  end

end
