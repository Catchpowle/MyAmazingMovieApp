require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "GenresMovies Model" do
  it 'can construct a new instance' do
    @genres_movies = GenresMovies.new
    refute_nil @genres_movies
  end
end
