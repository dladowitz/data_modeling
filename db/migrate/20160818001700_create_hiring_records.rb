class CreateHiringRecords < ActiveRecord::Migration
  def change
    create_table :hiring_records do |t|
      t.datetime :interview_date
      t.integer :start_salary
      t.datetime :start_date
      t.integer :employment_history_id, unique: true

      t.timestamps null: false
    end
  end
end
