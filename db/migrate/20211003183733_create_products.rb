class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
