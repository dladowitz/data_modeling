class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.integer :rating
      t.string :text

      t.timestamps null: false
    end
  end
end
