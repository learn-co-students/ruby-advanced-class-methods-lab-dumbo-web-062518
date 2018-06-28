class Song
  attr_accessor :name, :artist_name
  @@all = Array.new

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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      song = self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    name = filename.split(" - ")[1].split(".")[0]
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    name = filename.split(" - ")[1].split(".")[0]
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song.name = name
  end

  def self.destroy_all
    @@all.clear
  end

end
