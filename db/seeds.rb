# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "eatmytacos@gmail.com", password: "passw0rd", password_confirmation: "passw0rd")
User.create(email: "starchild@gmail.com", password: "hellogoodbye", password_confirmation: "hellogoodbye")

Rating.create(number: 5)
Rating.create(number: 4)
Rating.create(number: 3)
Rating.create(number: 2)
Rating.create(number: 1)

Business.create(name: "Taco Shop", price_range: "$", description: "A place for all taco lovers to gather and break freshly made corn tortillas.")

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

Business.create(name: "La Sirene", price_range: "$$$", description: )
