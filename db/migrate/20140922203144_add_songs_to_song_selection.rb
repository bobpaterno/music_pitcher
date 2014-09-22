class AddSongsToSongSelection < ActiveRecord::Migration
  def change
    add_reference :song_selections, :song, index: true
  end
end
