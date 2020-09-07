class CreateOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orderd_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
