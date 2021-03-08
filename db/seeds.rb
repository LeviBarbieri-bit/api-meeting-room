# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create user
User.create(email: "levibarbieri@gmail.com", password: "q1w2e3r4", name: "Levi Barbieri")
User.create(email: "jessica@gmail.com", password: "1234", name: "jessica")
User.create(email: "pedro@gmail.com", password: "1234", name: "pedro xx")
User.create(email: "henrique@gmail.com", password: "1234", name: "henrique xx")
User.create(email: "rafael@gmail.com", password: "1234", name: "rafael")
User.create(email: "guilherme@gmail.com", password: "1234", name: "guilherme")
#create schedules
Schedule.create(users_id: "2", date: "2021-03-15", time: "6:00", description: "loren ipsun")
 