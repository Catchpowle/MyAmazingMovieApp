class Writer < ActiveRecord::Base
  has_many :writers_movies
  has_many :movies, :through => :writers_movies

  before_save :set_slug

  protected
  def set_slug
    self.slug = self.name.chomp.strip.downcase.gsub(" ", "-")
  end

end
