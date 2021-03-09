class Schedule < ApplicationRecord
  #validation request
  belongs_to :user
  
  validates_presence_of :date, message: 'A data não pode ser deixada em branco'
  validates_presence_of :time, message: 'O tempo não pode ser deixado em branco'
  validates_uniqueness_of :date,:time, scope: [:date, :time], message: "período já reservado"

  
end
