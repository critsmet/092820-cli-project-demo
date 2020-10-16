class CLI

  def run
    puts "Hi, Welcome to the Pitchfork Review CLI Application!"
    sleep(1)
    puts "Loading data...this might take a second!"
    Scraper.new.first_scrape
    puts "Done!"
    sleep(1)
    puts "What would you like to view?"
    sleep (1)
    puts "1. All Reviews"
    puts "2. Reviews by Genre"
    puts " "
    puts "Enter 1 or 2"
    user_input = gets.chomp
    if user_input == "1"
      Review.print_all_reviews_to_be_selected
      puts "Enter a number 1-12 to view that review"
      review_select = gets.chomp
      select_to_index = review_select.to_i - 1
      Review.all[select_to_index].print_full_review
    elsif user_input == "2"
      #write the code here to display all of the genres
    end
  end

end
