require 'pry'

class Owner

  attr_reader :name, :species
 
  @@all = []
  @@count = 0

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@count = @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
      value = Cat.all.select do |cat|
        cat.owner == self
      end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
    
  def buy_cat(name)
     Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
  end
end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
  end

  def sell_pets
    Dog.all.select do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.select do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    # binding.pry
  end
end

end