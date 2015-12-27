class Recipe < ActiveRecord::Base
	belongs_to :blog
	has_many :images, as: :imageable
	has_and_belongs_to_many :ingredients
end
