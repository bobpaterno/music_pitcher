class CreateSongSelections < ActiveRecord::Migration
  def change
    create_table :song_selections do |t|
      t.integer :song_order

      t.timestamps
    end
  end
end
