class Schedule < ApplicationRecord
  #validation request
  belongs_to :user
  
  validates_presence_of :schedule, message: 'A data não pode ser deixada em branco'
  validates_uniqueness_of :schedule, scope: [:schedule], message: "período já reservado"
  validates_datetime :schedule, on_or_after: lambda {  Time.current }, message: 'Esta data já está expirada, favor agendar um novo período !!!'
  #validates_time :time,  on_or_after: lambda {  Time.current }, message: 'Este horário já está expirada, favor agendar um novo período !!!'
  #validates :user_id, on: :update, acceptance: { accept: logged_in_user[:id] }
  


end
