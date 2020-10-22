class Review

  @@all = []

  attr_accessor :artist, :album_title, :genre, :review, :score, :review_url

  def initialize(artist, album_title, genre, review_url)
    @artist = artist
    @album_title = album_title
    @genre = genre
    @review_url = review_url
    @@all << self
  end

  def self.all
    @@all
  end

  def print_review_artist_and_title
    puts "#{@album_title} by #{@artist}"
  end

  def self.print_all_reviews_to_be_selected
    @@all.each_with_index do |review, index|
      puts "Review #{index + 1}. ===================="
      review.print_review_artist_and_title
      puts ""
      sleep(1)
    end
  end

  def print_full_review
    check_for_review
    puts "===================="
    print_review_artist_and_title
    puts "Genre: #{genre.name} - + - + - + - + Score: #{@score}"
    puts " "
    puts @review
  end

  def check_for_review
    if @review === nil
      Scraper.new.second_scrape(self)
    end
  end

end
