class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.belongs_to :user , index: true
      t.text :description
      t.datetime :schedule, null: false
      t.timestamps
    end
  end
end
