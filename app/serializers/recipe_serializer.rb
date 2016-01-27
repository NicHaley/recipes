class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :servings, :cook_time, :recipe_path

  has_many :ingredients, serializer: IngredientSerializer
  has_many :images, serializer: ImageSerializer

end
