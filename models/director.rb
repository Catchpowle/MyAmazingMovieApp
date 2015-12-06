class Director < ActiveRecord::Base
  has_many :directors_movies
  has_many :movies, :through => :directors_movies

  before_save :set_slug

  protected
  def set_slug
    self.slug = self.name.chomp.strip.downcase.gsub(" ", "-")
  end

end
