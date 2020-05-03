# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(1..20).each do |n|
  user = User.create!(name: "user#{n}", email: "user#{n}@test.com", password: "password")
end

  
ranking1 = User.first.rankings.create!(title: "test1")

ranking2 = User.first.rankings.create!(title: "test2")


(1..10).each do |n|
  item1 = ranking1.items.create!(item: "item#{n}")
end

(11..20).each do |n|
  item1 = ranking2.items.create!(item: "item#{n}")
end

(1..10).each do |n|
  Vote.create!(user_id: n, item_id: n, comment: "コメント#{n}")
end

(11..20).each do |n|
  Vote.create!(user_id: n, item_id: n)
end

  