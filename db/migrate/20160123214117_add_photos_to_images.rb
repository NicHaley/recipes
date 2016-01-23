class AddPhotosToImages < ActiveRecord::Migration
  def change
    add_column :images, :photos, :text, array:true, default: []
  end
end
