class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :users, null: false, foreign_key: true
      t.string :time, null: false
      t.text :description
      t.date :date, null: false
      t.timestamps
    end
  end
end
