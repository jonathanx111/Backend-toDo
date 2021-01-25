# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Day.destroy_all
Task.destroy_all
User.destroy_all



start = Date.new(2020,1,1)
1095.times {
    Day.create!(date: start)
    start = start.tomorrow()
}

vivek = User.create!(username: "vivek", points: 0)
jonathan = User.create!(username: "jonathan", points: 0)



jan12021 = Day.find_by(date: "2021-01-01")
jan22021 = Day.find_by(date: "2021-01-02")
jan32021 = Day.find_by(date: "2021-01-03")
jan42021 = Day.find_by(date: "2021-01-04")

Task.create!(user_id: vivek.id, day_id: jan12021.id, description: "Cooking Dinner", points: 25, done: false)
Task.create!(user_id: vivek.id, day_id: jan12021.id, description: "Cleaning", points: 10, done: false)
Task.create!(user_id: vivek.id, day_id: jan22021.id, description: "Walk Dog", points: 5, done: false)
Task.create!(user_id: vivek.id, day_id: jan22021.id, description: "Fight Halal Guys", points: 1000, done: false)
Task.create!(user_id: jonathan.id, day_id: jan32021.id, description: "Cooking Dinner", points: 25, done: false)
Task.create!(user_id: jonathan.id, day_id: jan32021.id, description: "Study React", points: 1, done: false)
Task.create!(user_id: jonathan.id, day_id: jan42021.id, description: "Study AWS", points: 10, done: false)
Task.create!(user_id: jonathan.id, day_id: jan42021.id, description: "Study Node.js", points: 12, done: false)