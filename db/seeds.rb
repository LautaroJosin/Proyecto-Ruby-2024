# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'


10.times do
    Category.create!(
      name: Faker::Commerce.department(max: 1)
    )
end

puts "Categories created successfully!"


User.create!(
  email: "lau@gmail.com",
  username: "lau",
  password: "123456",
  phone: "1234567890",
  role_int: "admin",
  is_active: true
)

User.create!(
  email: "empleado@gmail.com",
  username: "Empleado",
  password: "123456",
  phone: "1234567890",
  role_int: "employee",
  is_active: true
)

User.create!(
  email: "gerente@gmail.com",
  username: "Gerente",
  password: "123456",
  phone: "1234567890",
  role_int: "manager",
  is_active: true
)

puts "Users created successfully!"


10.times do
  Client.create!(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    dni: Faker::IdNumber.spanish_citizen_number,
    phone: Faker::PhoneNumber.cell_phone
  )
end

puts "Clients created successfully!"
