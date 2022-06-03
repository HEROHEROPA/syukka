class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :order , null: false , foreign_key: true
      t.integer :config_id , null: false 
     
      t.timestamps
    end
  end
end
