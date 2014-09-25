class SongSelectionsController < ApplicationController
  def new
    @pitch = Pitch.find_by_id(params[:pitch_id])
    @songs = Song.all
    @song_selection = SongSelection.new
  end

  def create
    @pitch = Pitch.find_by_id(params[:pitch_id])
    @song = Song.find_by_id(params[:song_selection][:song_id])
    SongSelection.create(pitch: @pitch, song: @song)
    PitchesMailer.mail_pitch(@pitch).deliver
    redirect_to pitch_path(@pitch)
  end
end