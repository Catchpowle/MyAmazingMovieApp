class Genre < ActiveRecord::Base
  has_many :genres_movies
  has_many :movies, :through => :genres_movies

  before_save :set_slug

  protected
  def set_slug
    self.slug = self.name.chomp.strip.downcase.gsub(" ", "-")
  end

end
