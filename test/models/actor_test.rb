require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Actor Model" do
  it 'can construct a new instance' do
    @actor = Actor.new
    refute_nil @actor
  end
end
