class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :users
      t.string :time, null: false
      t.text :description
      t.date :date, null: false
      t.timestamps
    end
  end
end
