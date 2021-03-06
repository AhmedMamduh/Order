class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :main_orders do |t|
      t.decimal :total_price
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
