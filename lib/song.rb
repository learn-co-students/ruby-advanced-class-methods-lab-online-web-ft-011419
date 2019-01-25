class Song
  attr_accessor :name, :artist_name
  
  #def initialize(name, artist_name)
   # @name = name
    #@artist_name = artist_name
  #end   
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   song = self.new 
   @@all << song
   return song
  end 
  
  def self.new_by_name 
      
  end  

  def self.destroy_all
    self.all.clear
  end
  
  def self.create_from_filename
    self.name.split(" ").collect{|n| n.capitalize}.join(" ")
  end
end


