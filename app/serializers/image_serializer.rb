class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image_thumb, :image_main

  def image_thumb
  	object.photo.thumb.url
  end

  def image_main
  	object.photo.url
  end
end
