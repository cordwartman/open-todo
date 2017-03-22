require 'faker'

# Create Users
5.times do
  User.create!(
    email:  Faker::Internet.unique.email,
    name:   Faker::LordOfTheRings.character
    )
end

# Create a main user
admin = User.create(
  email:    'cordwartman@gmail.com',
  name:     'Cord'
)

# Create a second main user
admin = User.create!(
  email:    'test@example.com',
  name:     'fake name'
)

users = User.all

# Create Lists

20.times do
  list = List.create!(
    title: Faker::StarWars.character,
    private: false,
    user: users.sample
  )
end

lists = List.all

# Create Items
100.times do
  item = Item.create!(
    body: Faker::LordOfTheRings.location,
    list: lists.sample
  )
  item.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
