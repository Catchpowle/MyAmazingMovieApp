require 'pry'

MyAmazingMovieApp::App.controllers :movies do

  get :index do
    @movies = Movie.all
    render 'movie/index'
  end

  get :show, :with => :slug do
    @movie = Movie.find_by(:slug => params[:slug])
    if @movie
      render 'movie/show'
    else
      404
    end
  end

  get :new do
    @movie = Movie.new
    render 'movie/new'
  end

  post :create do
    title = params[:movie][:title]

    if title == ""
      redirect url_for(:movies, :index)
    end

    @movie = Movie.get_film_info(title)

    if @movie
      redirect url_for(:movies, :show, :slug => @movie.slug)
    else
      [404, { }, "404 not found"]
    end
  end

  get :edit, :with => :id do
    @movie = Movie.find_by(id: params["id"])
    render 'movie/edit'
  end

  put :update, :with => :id  do
    @movie = Movie.find_by(id: params["id"])

    @movie.update(params["movie"])

    redirect url_for(:movies, :show, :slug => @movie.slug)
  end

  delete :delete, :with => :id do
    @movie = Movie.find(params["id"])

    @movie.destroy

    redirect url_for(:movies, :index)
  end
end
