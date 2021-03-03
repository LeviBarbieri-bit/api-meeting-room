class Schedule < ApplicationRecord
  #validation request
  has_many :users
  validates_presence_of :date, message: 'Date cannot be left blank'
  validates_presence_of :time, message: 'Time cannot be left blank'

  validates_uniqueness_of :date,:time, scope: [:date, :time], message: "period already booked"

  
end
