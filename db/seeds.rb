# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cool = User.create(name: "Cool Lama", email: "c@mail.com", password: "password")
max = User.create(name: "Max Good", email: "m@mail.com", password: "password")
will = User.create(name: "Will Simpson", email: "w@mail.com", password: "password")


ingredients = ['chicken', 'salmon', 'steak', 'onions', 'salt', 'pepper', 'tomatoes', 'oil', 'water', 'rice', 'pasta']


def create_ingredients(ingredients)
  ingredients.each do |i|
    Ingredient.create(name: i)
  end
end

create_ingredients(ingredients)

