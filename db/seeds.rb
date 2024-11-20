# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

Scooter.destroy_all
User.destroy_all
file = URI.parse("https://www.smilecreations4u.com/blog/wp-content/uploads/AdobeStock_118630870.jpeg").open
user = User.new(first_name: "pedro", last_name: "pan", email: "test@test.test", password: "123456")
user.profile_picture.attach(io: file, filename: "pedro.jpeg", content_type: "image/jpeg")
user.save
Scooter.create(model: "Velocity V200",location: "picadilly square, London", description: "Lightweight electric scooter with a top speed of 25 km/h and a range of 40 km, perfect for urban commuting.", user: User.last, price_per_day: 122)
Scooter.create(model: "EcoRide X1", location: "picadilly square, London", description: "Foldable e-scooter with an extended battery life of 60 km and a sleek aluminum frame.", user: User.last, price_per_day: 200)
Scooter.create(model: "Thunderbolt T5", location: "picadilly square, London", description: "High-performance scooter with off-road tires and a powerful 500W motor for rugged terrains.", user: User.last, price_per_day: 50)
Scooter.create(model: "GlideMaster G300", location: "picadilly square, London", description: "Compact and efficient scooter designed for smooth rides, featuring a smart display and regenerative braking.", user: User.last, price_per_day: 44)
Scooter.create(model: "UrbanCruise 250", location: "picadilly square, London", description: "Stylish city scooter with a top speed of 20 km/h, featuring a shock-absorbing deck and LED headlights.", user: User.last, price_per_day: 230)
Scooter.create(model: "ZoomSwift Z20", location: "picadilly square, London", description: "Portable scooter with quick-fold technology and a powerful motor for daily commutes.", user: User.last, price_per_day: 123)
Scooter.create(model: "Raptor RX500", location: "picadilly square, London", description: "Heavy-duty electric scooter with dual suspension and an ultra-durable frame for tough rides.", user: User.last, price_per_day: 99)
Scooter.create(model: "LiteScoot L30", location: "picadilly square, London", description: "Eco-friendly scooter with a lightweight design and a long-lasting battery for up to 50 km of travel.", user: User.last, price_per_day: 23)
Scooter.create(model: "NovaRide NX", location: "picadilly square, London", description: "Futuristic scooter", user: User.last, price_per_day: 234)
