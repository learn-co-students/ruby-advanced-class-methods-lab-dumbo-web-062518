require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create #working
    song = Song.new
    Song.all << song
    song
  end

  def self.all(song=nil)
    if song.class == Song
      @@all << song
    end
    @@all
  end

  def self.new_by_name(song_name, artist_name=nil)
    song = Song.new
    song.name = song_name
    if artist_name
      song.artist_name = artist_name
    end
    song
  end

  def self.create_by_name(song_name, artist_name=nil)
    song = Song.new_by_name(song_name, artist_name)
    Song.all(song)
    song
  end

  def self.find_by_name(song_name)
    value = nil
    result = Song.all.each do |song|
      if song.name == song_name
        value = true
        return song
      end
    end
    value
  end

  def self.find_or_create_by_name(song_name)
    unless Song.find_by_name(song_name)
      Song.create_by_name(song_name)
    end
    Song.find_by_name(song_name)
  end

  def self.alphabetical
    Song.all.sort {|x,y| x.name.downcase <=> y.name.downcase }
  end

  def self.new_from_filename(file_name)
    song = file_name.sub(/.mp3\z/, "").split(" - ")[1]
    artist = file_name.split(" - ")[0]
    Song.new_by_name(song, artist)
  end

  def self.create_from_filename(file_name)
    song=Song.new_from_filename(file_name)
    Song.all(song)
  end

  def self.destroy_all
    @@all.clear
  end
end
