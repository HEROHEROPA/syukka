class CreateToStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :to_stocks do |t|
      t.references :stock , null: false , foreign_key: true
      t.integer :to_stock_amount , null: false 
      t.timestamps
    end
  end
end
