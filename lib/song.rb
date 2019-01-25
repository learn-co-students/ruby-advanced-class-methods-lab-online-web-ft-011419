class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
    
  # def self.all
  # @@all.
  # end
  # this method will expose everything in our Song class array @@all.
  end

  def save
    self.class.all << self
    
  # def save
  # this method will take everything in our Song class and save it in our Song class array @@all.
  end
  
  def self.create
    song = self.new
    song.save
    song
    
  # def self.create
  # this method will iniitialize a new song and place it in our Song class array @@all.
  end
  
  def self.new_by_name(new_song)
    song = self.new
    song.name = new_song
    song
    
  # def self.new_by_name(#)
  # this method will initialize a new song. The song instance will be set to that name.  The song will be saved to memory. This created an instance of Song. 
  #Ex: Song.new_by_name("Jingle Bells")
  # <Song @name="Jingle Bells">
  # Song.name => "Jingle Bells"
  end
  
  def self.create_by_name(new_song)
    song=self.create
    song.name = new_song
    song
    
  # def Song.create_by_name(#)
  # this method will create a new song, set its instance to a song name give to the method, and save it to @@all. 
  # Ex: Song.create_by_name("Bohemian Rhapsody")
  # <Song:sdfkjasd34234234 @name="Bohemian Rhapsody"
  # song => "Bohemian Rhapsody" 
  end
  
  def self.find_by_name(new_song)
    @@all.find do |songs|
      songs.name == new_song
      
  # def Song.find_by_name(#)
  # this method will search in @@all for any song matching the string given to the method. 
  # Ex: Song.find_by_name("Jingle Bells")
  # <Song @name= "Jingle Bells"> 
  end
end

  
  def self.find_or_create_by_name(new_song)
    self.find_by_name(new_song) || self.create_by_name(new_song)
    
  # def Song.find_or_create_by_name(#)
  # this method will utilize both find_by_name and create_by_name to determine if the song has already been created. 
  # is Song1 == Song 2? it true, returns true. 
  end
  
  def self.alphabetical
    @@all.sort_by{|songs| songs.name}
    
  # def Song.alphabetical
  # this method will sort @@all by name. 
  # the method will work assuming the names all begin with a letter of the alphabet, and same case.
end
  
  def self.new_from_filename(new_file)
    artists_file_name = new_file.split(" - ")
    artist_name = artists_file_name[0]
    song_name = artists_file_name[1].gsub(".mp3","")

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
    
    # This method takes a new filename, and reformats it depending on the type of file applied. 
    # If the file has a "-", ".mp3", "" then it will remove the special characters, and split the filename at "-".  
    # The filename is then pushed into .artist_name at [0], and .name at [1].  [0] being the first half of the new array, and [1] being the second. 
    # Returns song
  end
  
  def self.create_from_filename(filename)
    song =  self.new_from_filename(filename)
    song.save
  
  end

  def self.destroy_all
    @@all.clear
    
  # Song.destroy_all
  # this method will clear everything in @@all should the array need to be reset. 
  end
end


