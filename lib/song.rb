require 'pry'

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
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    item = self.find_by_name(name)
    if item
      return item
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{ |x| x.name }
  end
  
  def self.new_from_filename(name)
    song = self.new
    name_split = name.split(" - ")
    song.name = name_split[1].chomp(".mp3")
    song.artist_name = name_split[0]
    song
    #binding.pry
  end
  
  def self.create_from_filename(name)
    song = self.new
    name_split = name.split(" - ")
    song.name = name_split[1].chomp(".mp3")
    song.artist_name = name_split[0]
    song.save
    song
    #binding.pry
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
