class Song
  attr_accessor :name, :artist_name
  
  def initialize
    @name = name
    @artist_name = artist_name
  end   
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @all << self.new
    return self.new
  end 
  
end
