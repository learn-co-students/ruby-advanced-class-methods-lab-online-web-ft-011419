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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    name_of_song = self.new
    name_of_song.name = song_name
    name_of_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end

  def self.find_by_name(find_song)
    self.all.find{|song| song.name == find_song}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    split_file_name = file_name.split(" - ")
    remove_ext = split_file_name[1].split(".")
    new_song = self.new
    new_song.artist_name = split_file_name[0]
    new_song.name = remove_ext[0]
    new_song
  end

  def self.create_from_filename(full_song)
    self.all << self.new_from_filename(full_song)
  end

  def self.destroy_all
    self.all.clear
  end

end
