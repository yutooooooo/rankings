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

(1..30).each do |n|
  ranking1 = User.first.rankings.create!(title: "ランキング#{n}", "items_attributes"=>{"0"=>{"item"=>"item#{n + 1}"}, "1"=>{"item"=>"item#{n + 2}"}, "2"=>{"item"=>"item#{n + 3}"}, "3"=>{"item"=>"item#{n + 4}"}, "4"=>{"item"=>"item#{n + 5}"}, "5"=>{"item"=>"item#{n + 6}"}, "6"=>{"item"=>"item#{n + 7}"}, "7"=>{"item"=>"item#{n + 8}"}, "8"=>{"item"=>"item#{n + 9}"}, "9"=>{"item"=>"item#{n + 10}"}})
end

(1..10).each do |n|
  Vote.create!(user_id: n, item_id: n, comment: "コメント#{n}")
end

(11..20).each do |n|
  Vote.create!(user_id: n, item_id: n)
end

  