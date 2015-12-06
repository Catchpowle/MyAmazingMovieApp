class Movie < ActiveRecord::Base

  has_many :actors_movies
  has_many :actors, :through => :actors_movies
  has_many :directors_movies
  has_many :directors, :through => :directors_movies
  has_many :genres_movies
  has_many :genres, :through => :genres_movies
  has_many :movies_writers
  has_many :writers, :through => :movies_writers

  before_save :set_slug

  def self.get_film_info(title)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{title}")

    if imdb_data["Response"] != "False"
      m = Movie.find_or_create_by(title: imdb_data["Title"]) do |m|
        m.year = imdb_data["Year"].to_i
        m.description = imdb_data["Plot"]
        m.poster = imdb_data["Poster"]
        m.runtime = imdb_data["Runtime"]
      end
      imdb_data["Actors"].gsub(/, /, ',').split(",").each do |a|
        if !m.actors.find { |i| i.name == a }
          m.actors << Actor.find_or_create_by(name: a)
        end
      end
      imdb_data["Director"].gsub(/, /, ',').split(",").each do |d|
        if !m.directors.find { |i| i.name == d }
          m.directors << Director.find_or_create_by(name: d)
        end
      end
      imdb_data["Writer"].gsub(/, /, ',').split(",").each do |w|
        if !m.writers.find { |i| i.name == w }
          m.writers << Writer.find_or_create_by(name: w)
        end
      end
      imdb_data["Genre"].gsub(/, /, ',').split(",").each do |g|
        if !m.genres.find { |i| i.name == g }
          m.genres << Genre.find_or_create_by(name: g)
        end
      end
      m
    else
      false
    end
  end

  protected
  def set_slug
    self.slug = title.chomp.strip.downcase.gsub(" ", "-")
  end
end
