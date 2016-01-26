ingredients = ["Chicken", "Beef", "Spinach", "Mushrooms", "Pasta", "Tomato", "Carrot", "Onion"]

ingredients.each do |ingredient|
  Ingredient.create(
    name: ingredient
  )
end

20.times do
  recipe = Recipe.create(
    name: Faker::Lorem.words.join(' '),
    servings: 1 + rand(4),
    cook_time: "#{rand(180)} minutes",
    ingredient_lines: []
  )

  2.times do
    recipe.images.create! remote_photos_url: 'https://www.petfinder.com/wp-content/uploads/2012/11/dog-how-to-select-your-new-best-friend-thinkstock99062463.jpg'
  end

  4.times do
    offset = rand(Ingredient.count)
    recipe.ingredients << Ingredient.offset(offset).first
  end
end


10.times do
  Blog.create(
    name: Faker::Lorem.words.join(' ')
  )
end