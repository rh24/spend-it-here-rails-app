# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(email: "eatmytacos@gmail.com", password: "passw0rd", password_confirmation: "passw0rd")
u2 = User.create(email: "starchild@gmail.com", password: "hellogoodbye", password_confirmation: "hellogoodbye")

Category.create(name: "Restaurants")
Category.create(name: "Arts, crafts, and collectibles")
Category.create(name: "Baby")
Category.create(name: "Supermarkets")
Category.create(name: "Sports and outdoors")
Category.create(name: "Vehicle sales")
Category.create(name: "Nonprofit")
Category.create(name: "Travel")
Category.create(name: "Pets and animals")
Category.create(name: "Home and garden")
Category.create(name: "Health and personal care")
Category.create(name: "Women's clothing")
Category.create(name: "Men's clothing")
Category.create(name: "Retail")
Category.create(name: "Gifts and flowers")
Category.create(name: "Education")
Category.create(name: "Books and magazines")
Category.create(name: "Electronics and telecom")
Category.create(name: "Entertainment and media")
Category.create(name: "Financial services and products")
Category.create(name: "Services - other")
Category.create(name: "Vehicle service and accessories")
Category.create(name: "Religion and spirituality (for profit)")
Category.create(name: "Shoes")
Category.create(name: "Computers, accessories, and services")
Category.create(name: "Bath and body")
Category.create(name: "Children's clothing")
Category.create(name: "Other")

l1 = Location.create(name: "New York City, NY")
l2 = Location.create(name: "Brooklyn, NY")
l3 = Location.create(name: "Los Angeles, CA")
l4 = Location.create(name: "San Francisco, CA")
l5 = Location.create(name: "Chicago, IL")
l6 = Location.create(name: "N/A")

b1 = Business.new(name: "La Sirene", price_range: "$$$", description: "French cuisine. We accept Dogecoin.")
b1.location = l1
b1.save

b2 = Business.new(name: "Bicyclia", price_range: "$", description: "Bicycles for everyone. They come in all shapes and sizes. Just like people.")
b2.location = l2
b2.save

b0 = Business.new(name: "Taco Shop", price_range: "$", description: "A place for all taco lovers to gather and break freshly made corn tortillas.")
b0.location = l3
b0.save

c1 = Crypto.create(name: "Bitcoin")
c2 = Crypto.create(name: "Dogecoin")
c3 = Crypto.create(name: "Litecoin")
c4 = Crypto.create(name: "Ethereum")
c5 = Crypto.create(name: "Lisk")

r = Review.new(title: "My first crypto purchase!", comment: "Cash and cardless experience was a pleasure. Pleased to support adoption. Excellent food. I recommend the snails.", would_recommend: true, rating: 5)
r.user = u1
r.business = b1
r.crypto = c1
r.save

r2 = Review.new(title: "Second purchase ever!", comment: "Tacos taste better when purchased with crypto", would_recommend: true, rating: 4)
r2.user = u2
r2.business = b2
r2.crypto = c2
r2.save
