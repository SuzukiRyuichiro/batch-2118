require_relative '../scraper'

describe '#fetch_movies_url' do
  it "returns an array of top movies' corresponding IMDB URls" do
    expected = [
      'https://www.imdb.com/title/tt0111161/',
      'https://www.imdb.com/title/tt0068646/',
      'https://www.imdb.com/title/tt0468569/',
      'https://www.imdb.com/title/tt0071562/',
      'https://www.imdb.com/title/tt0050083/'
    ]
    actual = fetch_movies_url

    expect(actual).to eq(expected)
  end
end

describe '#scrape_movie' do
  it 'should scrape an individual movie page and return information about the movie' do
    expected = {
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      director: 'Christopher Nolan',
      summary: 'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.',
      title: 'The Dark Knight',
      year: 2008
    }

    actual = scrape_movie('https://www.imdb.com/title/tt0468569')

    expect(actual).to eq(expected)
  end
end
