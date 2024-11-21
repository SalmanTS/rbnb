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
file = URI.parse("https://i.pinimg.com/474x/1b/13/9f/1b139fce8698452f621953fc4ee2f95b.jpg").open
user = User.new(first_name: "Leonidas", last_name: "Zamora", email: "leonidas.zamora.gottwald@gmail.com", password: "123456")
user.profile_picture.attach(io: file, filename: "nico_omilana.jpeg", content_type: "image/jpeg")
user.save

array_of_images = [
  "https://www.billy.be/cdn/shop/products/Segway-NinebotKickscooterF2PROEfeaturesgallery-5.jpg?v=1682317934&width=533",
  "https://cdn.webshopapp.com/shops/87774/files/373149646/stuff-certified-ultraleichter-elektrischer-faltbar.jpg",
  "https://res.cloudinary.com/sharp-consumer-eu/image/fetch/w_3000,f_auto/https://s3.infra.brandquad.io/accounts-media/SHRP/DAM/origin/5be26330-9956-11ec-bfec-52210c5406e7.jpg",
  "https://fatdaddy.de/wp-content/uploads/2023/11/vsett-10-1-500x500.jpg",
  "https://m.media-amazon.com/images/I/31qzJodL8jL._AC_SR300,300.jpg",
  "https://elektroroller-futura.de/11762-thickbox_default/e-scooter-power.jpg",
  "https://cdn10.plentymarkets.com/mrt54q44tptl/item/images/12526/full/E-Scooter-Elektroroller-L8-STREET-schwarz--2-.jpg",
  "https://www.billy.be/cdn/shop/products/trottinette-electrique-etwow-gts-gt-sport-48v-10a-2023-noire.jpg?v=1681225421",
  "https://sxt-scooters.de/cdn/shop/files/ESCMNSTR_SXT_Monster_vorne_rechts.jpg?v=1712906577",
  "https://api.brusselstimes.com/wp-content/uploads/2022/02/ba6d24cb-image-from-ios-1.jpg"]
array_of_models = [
  "Urban Rider",
  "Eco Commuter",
  "Swift Cruiser",
  "Metro Glide",
  "City Zoomer",
  "Electric Explorer",
  "Compact Voyager",
  "Retro Glide",
  "Turbo Scooter",
  "Sleek Drifter"]
array_of_locations = [
  "New York, USA",
  "Berlin, Germany",
  "Paris, France",
  "Tokyo, Japan",
  "Barcelona, Spain",
  "San Francisco, USA",
  "Sydney, Australia",
  "Amsterdam, Netherlands",
  "Rome, Italy",
  "Seoul, South Korea"]
array_of_desctiptions = [
  "Lightweight and perfect for urban commutes.",
  "Eco-friendly scooter with a sleek design.",
  "Built for speed and smooth rides.",
  "Compact and ideal for busy city streets.",
  "A fun and zippy ride for everyday use.",
  "Efficient and powerful electric scooter.",
  "Portable and versatile for short trips.",
  "Stylish retro design with modern features.",
  "High-performance scooter for thrill-seekers.",
  "Sleek and reliable for daily commuting."
]
array_of_prices = [
  30,
  35,
  40,
  45,
  50,
  55,
  60,
  40,
  50,
  35
]

array_of_images.each_with_index do |image, index|
  single_image = URI.parse(image).open
  scooter = Scooter.new(model: array_of_models[index], location: array_of_locations[index], description: array_of_desctiptions[index], user: User.last, price_per_day: array_of_prices[index])
  scooter.images.attach(io: single_image, filename: "scooter_image.png", content_type: "image/png")
  scooter.save!
end
