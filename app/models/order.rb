class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :customer

  #https://note.com/yukinooffice/n/n626eed3287c5を参照
  enum status: {
    waiting_for_payment: 0,
    payment_confirmation: 1,
    making: 2,
    prepairing_to_ship: 3,
    shipped: 4,
  }


  #https://qiita.com/dawn_628/items/944c79b06299a35b5225
  enum method_payment: {
    credit_card: 0,
    bank: 1,
  }

end
