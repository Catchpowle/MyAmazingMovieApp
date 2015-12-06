class CreateMoviesWriters < ActiveRecord::Migration
  def self.up
    create_table :movies_writers do |t|
      t.integer :movie_id
      t.integer :writer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :movies_writers
  end
end
