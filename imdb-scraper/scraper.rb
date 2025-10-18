require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  # define the URL we are scraping (top charts of IMDB)
  url = 'https://www.imdb.com/chart/top/'
  # Open the page
  top_movies_page = URI.parse(url).read({
                                          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Accept-Language' => 'en'
                                        })
  # Parse it with nokogiri
  doc = Nokogiri::HTML.parse(top_movies_page)
  # Use the CSS selector to select elements that have the URL for individual movies
  doc.search('.ipc-title-link-wrapper').first(5).map do |element|
    # select the first five out of the matches
    # get the href value from the element (Array#map)
    "https://www.imdb.com#{element.attribute('href').value.match(%r{/title/\w{9}/})}"
  end
end

def scrape_movie(url)
  # Open the page
  movie_page = URI.parse(url).read({
                                     'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Accept-Language' => 'en'
                                   })
  # Parse it with nokogiri
  doc = Nokogiri::HTML.parse(movie_page)

  title = doc.search('.hero__primary-text').text
  year = doc.search('.ipc-inline-list__item')[4].text.to_i
  summary = doc.search('.sc-bf30a0e-1').text.strip
  director = doc.search('.sc-af040695-2 ul.ipc-inline-list')[0].text.strip
  cast = doc.search('.sc-af040695-2 .ipc-metadata-list__item:last-child ul.ipc-inline-list li').map do |element|
    element.text.strip
  end

  {
    title: title,
    cast: cast,
    director: director,
    summary: summary,
    year: year
  }
end
