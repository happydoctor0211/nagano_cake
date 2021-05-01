class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.timestamps :created_at
      t.timestamps :upted_at

      t.timestamps
    end
  end
end
