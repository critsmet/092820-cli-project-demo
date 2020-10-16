class Character

  @@all = []

  attr_accessor :name, :planet

  def initialize(name, planet)
    @name = name
    @planet = planet
    @@all << self
  end

  def self.all
    @@all
  end

end
