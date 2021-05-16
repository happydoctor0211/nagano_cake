class OrderItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  enum making_status: {
    can_not_make: 0,
    waiting_for_making: 1,
    making: 2,
    made: 3,
  }
  
end

