class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,            null: false
      t.text  :explain,                null: false  
      t.integer :category_id,          null: false  
      t.integer :status_id ,           null: false  
      t.integer :shipping_fee_id,      null: false  
      t.integer :prefecture_id,        null: false  
      t.integer :delivery_schedule_id, null: false  
      t.integer :price,                null: false  
      t.references :user, foreign_key: true, null: false 
      t.timestamps,                    null: false  
    end
  end
end
