class Public::CustomersController < ApplicationController
  
  def show
  end
  
  def edit
    @customer =  Customer.find(current_customer.id)
  end
  
end
