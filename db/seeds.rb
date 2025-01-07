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

puts "10 categories created successfully!"

User.create!(
  email: "lau@gmail.com",
  username: "lau",
  password: "123456",
  phone: "1234567890",
  role_int: "admin",
  is_active: true
)

puts "Admin user created successfully!"

# 10.times do
#   Product.create!(
#     name: Faker::Commerce.product_name,
#     description: Faker::Lorem.sentence(word_count: 10),
#     price: Faker::Commerce.price(range: 10..100.0),
#     stock: rand(1..50),
#     category_id: rand(1..10),
#     size: %w[S M L XL].sample,
#     color: Faker::Color.color_name
#   )

#   product.image.attach(
#     io: URI.open("https://via.placeholder.com/300"), # URL de una imagen simulada
#     filename: "placeholder.jpg",
#     content_type: "image/jpg"
#   )

# end
