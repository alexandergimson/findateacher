# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.where(name: "Piano").first_or_create(name: "Piano")
Category.where(name: "Drums").first_or_create(name: "Drums")
Category.where(name: "Guitar").first_or_create(name: "Guitar")
Category.where(name: "Bass").first_or_create(name: "Bass")
Category.where(name: "Saxophone").first_or_create(name: "Saxophone")
