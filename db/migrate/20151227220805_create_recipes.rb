class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :servings
      t.string :cook_time
      t.string :recipe_path
      t.integer :blog_id

      t.timestamps null: false
    end
  end
end
