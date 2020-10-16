class Genre

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def reviews
    Review.all.select {|review| review.genre == self}
  end

  def self.find_or_create_by_name(name)
    found_genre = self.all.find {|genre| genre.name == name}
    if found_genre
      return found_genre
    else
      return self.new(name)
    end
  end

  def self.all
    @@all 
  end

end
