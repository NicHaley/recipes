class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image_main

  def image_main
  	object.photo.url
  end
end
