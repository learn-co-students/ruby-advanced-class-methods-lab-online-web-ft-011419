require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    
   song = self.new
   song.save
   song
  
  end
  
  def self.new_by_name(name)
    
   song = self.new
   song.name = name
   song.save
   song
    
  end

  def self.create_by_name(name)
    
    song = self.new
    song.name = name
    song.save
    song
    
  end
  
  def self.find_by_name(name)
    
    self.all.collect do |song|
      
      if song.name == name
        
        return song
        
      end
      
    end
    
    return nil
    
  end
  
  def self.find_or_create_by_name(name)
    
    song = find_by_name(name)
    
    if song == nil

      
      song = create_by_name(name)
    
    end
    
    song
    
  end
  
  def self.alphabetical
    
     self.all.sort_by {|song| song.name}
   
  end
  
  def self.new_from_filename(file)
    
    array = file.split("-")
    artist = array[0].strip
    array[1].slice!(".mp3")
    name = array[1].strip
  
    
    song = self.new
    song.name = name
    song.artist_name = artist
    song
   
    
  end
  
  def self.create_from_filename(file)
    array = file.split("-")
    artist = array[0].strip
    array[1].slice!(".mp3")
    name = array[1].strip
  
    
    song = self.new
    song.name = name
    song.artist_name = artist
    song.save
    song
    
    
  end
  
  
  
  def self.destroy_all
    
    self.all.clear
    
  end
  
  
end
