require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "GET to /movies/jaws" do
  describe "with a movie in the db" do
    before do
      Movie.create!(:title => "Jaws")
      get "/movies/jaws"
    end

    it "should display information about Jaws" do
      assert last_response.ok?
      last_response.headers['Content-Type'].must_equal 'text/html;charset=utf-8'
      last_response.body.must_match "Jaws"
    end
  end

  describe "without a movie in the omdb / db" do
    before do
      get '/movies/jaws'
    end

    it "should 404" do
      assert last_response.not_found?
    end
  end
end

describe "GET to /movies" do
  before do
    Movie.create!(:title => "Jaws")
    get '/movies'
  end

  it "should display all of the films" do
    assert last_response.ok?
    last_response.headers['Content-Type'].must_equal 'text/html;charset=utf-8'
    last_response.body.must_match "<li>Jaws</li>"
  end
end

describe "Editing a movie" do
  before do
    @movie = Movie.create!(:title => "Jaws")
    get "/movies/#{@movie.id}/edit"
  end

  it "should display a form for me to edit my movie" do
    assert last_response.ok?
    last_response.headers['Content-Type'].must_equal 'text/html;charset=utf-8'
  end
end

describe "submitting my changes" do
  before do
    @movie = Movie.create!(:title => "Jaws")
    post "/movies/#{@movie.id}/update", { movie: { title: 'Jaws 2'} }
  end

  it "should update the movie" do
    Movie.count.must_equal 1
    @movie.reload.title.must_equal 'Jaws 2'
  end
end


describe "Adding a movie" do
  it "should display a form for me to add my movie" do
    get "/movies/new"
  end

  it "should add a movie" do
    post "/movies/create", { movie: { title: 'Jaws' } }
    Movie.count.must_equal 1
    Movie.first.title.must_equal 'Jaws'
  end
end

describe "Deleting a movie" do
  it "should add a movie" do
    @movie = Movie.create!(:title => "Jaws")
    Movie.count.must_equal 1
    post "/movies/#{@movie.id}/delete", { movie: { title: 'Jaws'} }
    Movie.count.must_equal 0
  end
end
