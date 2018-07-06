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
    self.all << song
    return song
  end

  def self.new_by_name(string)
    song = Song.new
    song.name = string
    return song
  end

  def self.create_by_name(string)
    song = Song.new
    self.all << song
    song.name = string
    return song
  end

  def self.find_by_name(string)
    self.all.find do |song|
      song.name == string
    end
  end

  def self.find_or_create_by_name(string)
    if self.find_by_name(string) == nil
      self.create_by_name(string)
    else
      self.find_by_name(string)
    end
  end

  def self.alphabetical
    # binding.pry
self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(string)
    song = Song.new
    name_array = string.split(" - ")
    song.artist_name = name_array[0]
    song.name = name_array[1].chomp('.mp3')
    return song
    # binding.pry
  end

  def self.create_from_filename(string)
    song = new_from_filename(string)
    self.all << song
    return song
    # binding.pry
  end

  def self.destroy_all
    self.all.clear
  end

end
