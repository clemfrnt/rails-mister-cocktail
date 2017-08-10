# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
ingredients_url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = open(ingredients_url).read
quote = JSON.parse(list)
quote["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

Cocktail.destroy_all
cocktails_url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
list = open(cocktails_url).read
quote = JSON.parse(list)
quote["drinks"].each do |cocktail|
  Cocktail.create!(name: cocktail['strDrink'])
end
