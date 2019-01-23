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

  def self.new_by_name(s_name)
    song = self.new
    song.name = s_name
    song
  end

  def self.create_by_name(s_name)
    song = self.new
    song.name = s_name
    song.save
    song
  end

 def self.find_by_name(s_name)
   self.all.detect {|song| song.name == s_name}
   end


 def self.find_or_create_by_name(s_name)
   found = find_by_name(s_name)
    if found == nil
      create_by_name(s_name)
    else
      found
 end
 end

 def self.new_from_filename(file_name)
   song = self.new
   song.artist_name = file_name.split(" -").first
   song.name = file_name.split(/[-]\s|[.]/)[1]
   song
 end

 def self.create_from_filename(file_name)
   song = self.new
   song.artist_name = file_name.split(" -").first
   song.name = file_name.split(/[-]\s|[.]/)[1]
   song.save
 end


 def self.alphabetical
     self.all.sort_by {|song| song.name}
 end


  def self.destroy_all
    @@all.clear
  end

end
