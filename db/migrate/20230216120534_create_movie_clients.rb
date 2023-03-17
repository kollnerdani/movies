class CreateMovieClients < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_clients do |t|
      t.string :keyword
      t.integer :page, default: 1
      t.json :result
      t.integer :hit, default: 0
      t.timestamps
    end
  end
end
