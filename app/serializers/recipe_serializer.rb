class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :servings, :cook_time, :recipe_path

  # NOTE: Do not forget to "include" images in recipe controller
  has_many :ingredients, serializer: IngredientSerializer
  has_many :images, serializer: ImageSerializer

end
