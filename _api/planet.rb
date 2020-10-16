class Planet

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def characters
    Character.all.select {|char| char.planet == self }
  end

  def self.find_or_create_by_name(name)
    found_planet = self.all.find {|planet| planet.name == name}
    if found_planet
      return found_planet
    else
      return self.new(name)
    end
  end

end
