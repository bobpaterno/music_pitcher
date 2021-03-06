class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.text :description
      t.string :audiofile

      t.timestamps
    end
  end
end
