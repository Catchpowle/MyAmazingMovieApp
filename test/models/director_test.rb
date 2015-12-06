require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Director Model" do
  it 'can construct a new instance' do
    @director = Director.new
    refute_nil @director
  end
end
