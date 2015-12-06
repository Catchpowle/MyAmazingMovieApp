require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Genre Model" do
  it 'can construct a new instance' do
    @genre = Genre.new
    refute_nil @genre
  end
end
