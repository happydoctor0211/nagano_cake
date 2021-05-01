class Item < ApplicationRecord
  
  attachment :image
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  
  
  # https://note.com/yukako15/n/n76f7fc35483eを参照

end
