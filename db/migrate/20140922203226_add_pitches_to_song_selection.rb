class AddPitchesToSongSelection < ActiveRecord::Migration
  def change
    add_reference :song_selections, :pitch, index: true
  end
end
