class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :users, null: false, foreign_key: true
      t.string :time, null: false
      t.date :time, null: false
      t.timestamps
    end
  end
end
