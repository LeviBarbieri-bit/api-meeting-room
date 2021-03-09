class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.belongs_to :user , index: true
      t.string :time, null: false
      t.text :description
      t.date :date, null: false
      t.timestamps
    end
  end
end
