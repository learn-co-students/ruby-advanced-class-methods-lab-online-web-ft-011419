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
    self.all << self.new
    self.all[-1]
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.new
    song.name = title
    self.all << song
    song
  end
  
  def self.find_by_name(title)
    self.all.find { |song| song.name == title }
  end
  
  def self.find_or_create_by_name(title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create_by_name(title)
  end
  
  def self.alphabetical
    self.all.sort_by! { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].split(".")[0]
    song.artist_name = filename.split(" - ")[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].split(".")[0]
    song.artist_name = filename.split(" - ")[0]
    self.all << song
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
