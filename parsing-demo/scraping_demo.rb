require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from https://www.bbcgoodfood.com

ingredient = 'sourdough'
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.parse(url).read
html_doc = Nokogiri::HTML.parse(html_file)

html_doc.search('div.layout-md-rail div.card__content a.d-block').each do |element|
  puts element.attribute('href').value
end
# print all recipe names
