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
				link = link['href']
				puts link
				page = mechanize.get(link)

				# Recipe Name
				puts mechanize.page.at(".recipename").nil? ? mechanize.page.at(".recipe-header a span").text : mechanize.page.at(".recipename").text

				# Yield
				puts mechanize.page.at(".yield").nil? ? "No yield information" : mechanize.page.at(".yield").text

				# Total Time
				puts mechanize.page.at(".totaltime").nil? ? "No time information" : mechanize.page.at(".totaltime").text

				# Ingredients
				selector = mechanize.page.search(".ingredient").any? ? ".ingredient" : "blockquote li"
				mechanize.page.search(selector).each do |ingredient|
					puts ingredient.text
				end
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