require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "DirectorsMovies Model" do
  it 'can construct a new instance' do
    @directors_movies = DirectorsMovies.new
    refute_nil @directors_movies
  end
end
