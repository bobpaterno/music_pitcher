class SongSelectionsController < ApplicationController
  def new
  end

  def create
    @pitch = Pitch.find_by_id(params[:song_selection][:pitch])
    @song = Pitch.find_by_id(params[:song_selection][:song])
    SongSelection.create(pitch_id: @pitch, song_id: @song)
    redirect_to pitch_path(@pitch)
  end
end