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

    def self.new_by_name(new_song)
     song = self.new
     song.name = new_song
     song
    end

    def self.create_by_name(new_song)
     song=self.new
     song.name = new_song
     @@all << song
     song
    end

    def Song.find_by_name(new_song)
       @@all.find do  |s|
          s.name == new_song
      end
    end

    def Song.find_or_create_by_name(new_song)
      if  Song.find_by_name(new_song) == nil
      Song.create_by_name(new_song)
    else
      Song.find_by_name(new_song)
      end
    end

        def self.alphabetical
          @@all.sort_by {|s| s.name        }
        end
        def self.new_from_filename(data_song)
          array =data_song.split(/[-.]/)
          artist = array[0].strip
          song_name = array[1].strip
            song = self.new
            song.name = song_name
            song.artist_name = artist
            song
            end

        def self.create_from_filename(data_song)
            array = data_song.split(/[-.]/)
          artist =array[0].strip
          song_name  = array[1].strip
          song= self.create
          song.name = song_name
          song.artist_name= artist
          song
        end

        def self.destroy_all
          @@all.clear
        end

end
