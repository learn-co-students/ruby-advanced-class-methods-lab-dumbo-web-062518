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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name (song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name (song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name (song_name)
    self.all.find do |song|
      if song_name == song.name
        song.name
      end
    end
  end

  def self.find_or_create_by_name (song_name)
    self.create_by_name(song_name)
    self.find_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename (filename)
    split_file= []
    split_artist = []
    split_song = []
    split_artist_only = []

    split_file << filename.split('-').flatten
      #splits file based on "-"

    split_artist << split_file.flatten[0]
      #contains artist as a single string in an array

    song_name = split_artist.flatten.join.strip
      #contains ==> "Thundercat"

    split_song << split_file.flatten[1].split('.')
      #contains ==> [" For Love I Come", "mp3"]

    split_artist_only << split_song.flatten[0].strip
      #contains ==> ["For Love I Come"]
      #binding.pry

    # song_name = split_artist.flatten.join.strip
    song_artist = split_artist_only.flatten.join.strip

    song = self.create
    song.name = song_artist
    song.artist_name = song_name
    #binding.pry

    song
  end

  def self.create_from_filename (filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
