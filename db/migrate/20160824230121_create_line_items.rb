class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true, foreign_key: true
      t.integer :purchasable_id
      t.string :purchasable_type
      t.integer :item_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
