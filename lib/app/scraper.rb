class Scraper
  def initialize
    @base_url = "https://pitchfork.com"
  end

  def first_scrape
    html = open(@base_url + "/reviews/albums")
    html_parsed_to_elements = Nokogiri::HTML(html)
    review_elements = html_parsed_to_elements.css('.review')

    review_elements.each do |review_element|
      artist = review_element.css("li")[0].text
      album_title = review_element.css("h2").text
      genre_name = review_element.css("a")[1].text
      review_url = review_element.css(".review__link")[0].attr("href")

      genre = Genre.find_or_create_by_name(genre_name)

      review = Review.new(artist, album_title, genre, review_url)
    end
  end

  def second_scrape(review)
    review_html = open(@base_url + review.url)
    review_html_parsed_to_elements = Nokogiri::HTML(review_html)
    review.review = review_html_parsed_to_elements.css(".review-detail__abstract").text
    review.score = review_html_parsed_to_elements.css(".score").text
  end

end
