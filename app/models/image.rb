class Image < ActiveRecord::Base
	mount_uploader :photos, PhotoUploader

	belongs_to :imageable, polymorphic: true
end
