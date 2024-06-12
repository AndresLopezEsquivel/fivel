# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              phone_number: Faker::PhoneNumber.cell_phone,
              password: "password")
end

20.times do
  Service.create(title: Faker::Book.title,
                 description: Faker::Lorem.paragraph,
                 price: Faker::Number.decimal(l_digits: 2),
                 category: Faker::Book.genre,
                 delivery_time: Faker::Number.number(digits: 2).to_s,
                 user_id: User.all.sample.id)
end

20.times do
  service = Service.all.sample
  user = User.all.sample
  next if service.user == user

  Sale.create(status: ["completed", "in progress", "cancelled"].sample,
              date: Date.today + service.delivery_time.to_i,
              price: Faker::Number.decimal(l_digits: 2),
              rating: Faker::Number.between(from: 1, to: 5),
              user_id: user.id,
              service_id: service.id)
end

puts "Seed data generated successfully"
