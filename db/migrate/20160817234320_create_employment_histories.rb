class CreateEmploymentHistories < ActiveRecord::Migration
  def change
    create_table :employment_histories do |t|
      t.belongs_to :employee, index: true, unique: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
