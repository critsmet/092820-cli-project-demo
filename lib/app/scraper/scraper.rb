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

      review_and_score_hash = self.second_scrape(review_url)

      # genre = Genre.find_or_create_by(genre_name)

      review = Review.new(artist, album_title, genre_name, review_and_score_hash[:review], review_and_score_hash[:score])

      puts "================================="
      puts "Artist Name: #{artist}"
      puts "Album Title: #{album_title}"
      puts "Genre: #{genre_name}"
      puts ""
      puts "Score: #{review_and_score_hash[:score]}"
      puts "Review: #{review_and_score_hash[:review]}"
      puts ""
    end
  end

  def second_scrape(review_url)
    review_html = open(@base_url + review_url)
    review_html_parsed_to_elements = Nokogiri::HTML(review_html)
    review = review_html_parsed_to_elements.css(".review-detail__abstract").text
    score = review_html_parsed_to_elements.css(".score").text
    return {score: score, review: review}
  end

end
