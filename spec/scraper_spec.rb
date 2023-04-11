require_relative "../scraper"

describe '#scrape_top_5_urls' do
  it 'returns an array of the top 5 movie urls (as strings)' do
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(scrape_top_5_urls()).to eq(expected)
  end
end

describe '#scrape_movie(url)' do
  it 'returns a hash with the movie information' do
    url = 'https://www.imdb.com/title/tt0468569/'
    movie = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008,
      rating: 9.0
    }
    expect(scrape_movie(url)).to eq(movie)
  end
end