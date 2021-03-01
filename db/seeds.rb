# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create user
User.create!(email: "levibarbieri@gmail.com", password: "q1w2e3r4", name: "Levi Barbieri")

#create schedules
Schedule.create(users_id: "7", date: "2021-03-15", time: "6:00")
 