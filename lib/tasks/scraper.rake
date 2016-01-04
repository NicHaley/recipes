namespace :scrape do
	desc "Scrape I Am A Food Blog"
	task :iamafoodblog do
		mechanize = Mechanize.new
		page = mechanize.get('http://iamafoodblog.com/category/recipes/')

		loop do

			next_link = mechanize.page.link_with(text: '›')
			puts "NEXT LINK: #{next_link}"

			links = mechanize.page.search('.thumbnail > a')

			links.each do |link|
				recipe = Recipe.create()

				# Recipe Path
				link = link['href']
				recipe.recipe_path = link
				puts "Link: #{link}"

				page = mechanize.get(link)

				# Recipe Name
				name = mechanize.page.at(".recipename").nil? ? mechanize.page.at(".recipe-header a span").text : mechanize.page.at(".recipename").text
				recipe.name = name
				puts "Name: #{name}"

				# Servings
				servings = mechanize.page.at(".yield").nil? ? "No yield information" : mechanize.page.at(".yield").text
				recipe.servings = servings
				puts "Servings: #{servings}"

				# Total Time
				time = mechanize.page.at(".totaltime").nil? ? "No time information" : mechanize.page.at(".totaltime").text
				recipe.cook_time = time
				puts "Time: #{time}"

				# Ingredients
				selector = mechanize.page.search(".ingredient").any? ? ".ingredient" : "blockquote li"
				mechanize.page.search(selector).each do |ingredient|
					puts "Ingredient Line: #{ingredient.text}"
					recipe.ingredient_lines << ingredient
				end
				recipe.save
				puts "🍗🍗🍗🍗🍗🍗🍗 WELL DONE 🍗🍗🍗🍗🍗🍗🍗🍗"
			end

			break if next_link == nil
			page = next_link.click
			puts "-------------- NEW PAGE --------------"

		end
	end

	desc "Scrape all websites"
	task all: [:iamafoodblog]

end