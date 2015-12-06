class Actor < ActiveRecord::Base
  has_many :actors_movies
  has_many :movies, :through => :actors_movies

  before_save :set_slug

  protected
  def set_slug
    self.slug = self.name.chomp.strip.downcase.gsub(" ", "-")
  end

end
