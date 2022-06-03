class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :item_number, null:false
      t.integer :stock_amount, null:false
      t.text :item_image, null:false
      t.text :confirm_point

      t.timestamps
    end
  end
end
