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
    song.name = name
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(mp3_formatted_file)
    
    data = self.new 
    data.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    data.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    data
  end
  
  def self.create_from_filename(mp3_formatted_file)
    data = self.new 
    data.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    data.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    data.save
    data
  end

  def self.destroy_all
    self.all.clear
  end
end
