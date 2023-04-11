require "open-uri"
require "nokogiri"

def scrape_top_5_urls
  # Download the html of the page
  url = "https://www.imdb.com/chart/top"
  html_doc = URI.open(url).read
  # Parse the html
  html = Nokogiri::HTML(html_doc)

  # search for the urls of the first 5 movies
  html.search(".titleColumn a").first(5).map do |element|
    "https://www.imdb.com#{element.attribute("href").value}"
  end
  # return an array
end

def scrape_movie(url)

  html_content = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  doc = Nokogiri::HTML(html_content)

  director = doc.search('.ipc-metadata-list-item__list-content-item').first.text.strip
  storyline = doc.search(".sc-5f699a2-0").text.strip
  year = doc.search(".sc-afe43def-4 a").first.text.strip.to_i
  rating = doc.search("span.sc-bde20123-1.iZlgcd").text.strip[0].to_f
  cast = doc.search(".sc-bfec09a1-1").first(3).map do |element|
    element.text.strip
  end
  title = doc.search('.sc-afe43def-0').text.strip

  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year,
    rating: rating
  }

end

p scrape_movie("https://www.imdb.com/title/tt0468569/")