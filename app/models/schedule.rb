class Schedule < ApplicationRecord
  has_many :users
  #validation request
  validates_presence_of :date, message: 'Date cannot be left blank'
  validates_presence_of :time, message: 'Time cannot be left blank'

  validates_uniqueness_of :date,:time, scope: [:date, :time], message: "period already booked"
end
