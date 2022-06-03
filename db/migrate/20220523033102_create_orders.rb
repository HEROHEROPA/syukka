class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_number, null:false
      t.integer :order_amount, null:false

      t.timestamps
    end
  end
end

