class Song

  attr_accessor :name
  # attr_reader :artist_name

  @@all = []

  def self.all
    @@all
  end

  def artist_name
    @artist_name
  end

  def artist_name=(given_argument)
    @artist_name = given_argument
  end


  def initialize (name="")
    @name = name
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    # @@all << self
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new(name)
    new_song
  end

  def self.create_by_name(name)
    song=self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  def self.alphabetical
    # binding.pry
    @@all.sort_by{|song|song.name}
  end

  def self.new_from_filename(name)
    new_song = name.split(/[-.]/).map(&:strip)
    song_instance = self.new_by_name(new_song[1])
    song_instance.artist_name=(new_song[0])
    song_instance
  end

  def self.create_from_filename(name)
    new_song = name.split(/[-.]/).map(&:strip)
    song_instance = self.create_by_name(new_song[1])
    song_instance.artist_name=(new_song[0])
    song_instance
  end

  def self.destroy_all
    @@all.clear{|song|song.name == name}
  end

end
