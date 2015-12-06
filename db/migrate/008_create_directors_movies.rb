class CreateDirectorsMovies < ActiveRecord::Migration
  def self.up
    create_table :directors_movies do |t|
      t.integer :director_id
      t.integer :movie_id
      t.timestamps
    end
  end

  def self.down
    drop_table :directors_movies
  end
end
