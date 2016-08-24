class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.datetime :shipping_date

      t.timestamps null: false
    end
  end
end
