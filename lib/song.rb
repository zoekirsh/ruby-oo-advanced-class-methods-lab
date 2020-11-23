require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize (name = nil)
    @name = name
  end

  def self.create
    new = Song.new
    @@all << new
    new
  end


  def self.new_by_name (name)
    Song.new(name)
  end

  def self.create_by_name (name)
    new = Song.new(name)
    @@all << new
    new
  end

  def self.find_by_name (name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    split_arr = filename.split(/[-.]/).map {|string| string.strip}
    new_song = self.create_by_name(split_arr[1])
    new_song.artist_name = split_arr.first
    new_song
  end

  def self.create_from_filename (filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end




  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
