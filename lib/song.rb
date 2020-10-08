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
    return song
    # binding.pry
  end
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      return self.create_by_name(name)
    end
    self.find_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by {|song|song.name}
  end
  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    song = Song.new_by_name(data[1].delete_suffix(".mp3"))
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear()
  end

end
new_song = Song.create
# binding.pry