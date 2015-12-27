class Recipe < ActiveRecord::Base
	belongs_to :blog
	has_many :images, as: :imageable
end
