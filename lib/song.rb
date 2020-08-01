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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.save
    s.name = name
    s
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  artist = self.find_by_name(name)
    if artist
      return artist
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(name)
    parts[0] = name.split(" - ")
    parts[1] = name.split(".mp3")
    parts.name = name
    name_of_song = parts[0]
    song_artist = parts[1]
    return name_of_song
  end


end
