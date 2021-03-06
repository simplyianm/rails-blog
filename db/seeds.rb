# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
10.times do |i|
  users << User.create(username: Faker::Internet.user_name,
              password: Faker::Internet.password,
              email: Faker::Internet.safe_email)
end

50.times do |i|
  Article.create(title: Faker::Lorem.sentence,
                 text: Faker::Lorem.paragraphs(5).join("\n\n"),
                 user: users[i % users.length])
end
