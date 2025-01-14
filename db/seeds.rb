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


categories = [
  "Ropa Deportiva - Camisetas",
  "Ropa Deportiva - Pantalones",
  "Calzado Deportivo - Zapatillas de Running",
  "Ropa Deportiva - Chaquetas",
  "Accesorios - Gorros",
  "Ropa Deportiva - Shorts",
  "Ropa Deportiva - Mallas",
  "Ropa Deportiva - Sudaderas",
  "Accesorios - Guantes",
  "Accesorios - Calcetines",
  "Accesorios - Mochilas",
  "Calzado Deportivo - Botines de Fútbol"
]

categories.each do |category_name|
  Category.create!(
    name: category_name
  )
end

puts "Categories created successfully!"


# categories = Category.all

# 10.times do
#   Product.create!(
#     name: Faker::Commerce.product_name,  # Nombre del producto generado aleatoriamente
#     description: Faker::Lorem.sentence,   # Descripción generada aleatoriamente
#     price: Faker::Commerce.price(range: 10..500.0),  # Precio aleatorio entre 10 y 500
#     stock: rand(1..100),  # Stock aleatorio entre 1 y 100
#     deleted_at: nil,  # Aseguramos que deleted_at sea null
#     category: categories.sample,  # Asignamos una categoría aleatoria
#     size: [ 'S', 'M', 'L', 'XL', 'XXL' ].sample,  # Tamaño aleatorio
#     color: Faker::Color.color_name  # Color generado aleatoriamente
#   )
# end
#
# puts "Products created successfully!"


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
