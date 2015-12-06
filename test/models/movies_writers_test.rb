require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "MoviesWriters Model" do
  it 'can construct a new instance' do
    @movies_writers = MoviesWriters.new
    refute_nil @movies_writers
  end
end
