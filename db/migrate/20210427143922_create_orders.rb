class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :status, default: "0"
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :method_payment
      t.integer :shipping
      t.integer :total_payment
      t.timestamp :created_at, default: "now"
      t.timestamp :updated_at, default: "now"

      t.timestamps
    end
  end
end
