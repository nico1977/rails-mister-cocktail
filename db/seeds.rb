# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "pry"
require "json"
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

# Go fetch the contents of a URL & store them as a String
response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

# "Pretty prints" the result to look like a web page instead of one long string of HTML
result = JSON.parse(response)
puts "seeding.........."
results = result["drinks"]
results.each do |ingredient_hash|
  puts "creating ingredient #{ingredient_hash['strIngredient1']}"
  Ingredient.create!(name: ingredient_hash["strIngredient1"])
end
# Print the contents of the website to the console

