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

    def self.new_by_name(new_song)
     song = self.new
     song.name = new_song
     song
    end

    def Song.create_by_name(new_song)
     song=self.new
     song.name = new_song
     @@all << song
     song
    end

    def Song.find_by_name(new_song)
     song=self.new
     song.name = new_song

     #@@all.each do  |s|  s.name =
    end

end
