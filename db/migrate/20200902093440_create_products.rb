class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :explain
      t.boolean :status, default: true
      t.integer :price

      t.timestamps
    end
  end
end
