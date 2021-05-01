class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :making_status
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
