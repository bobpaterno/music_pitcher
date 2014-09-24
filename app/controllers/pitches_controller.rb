class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    if @pitch.save
      redirect_to song_select_pitch_path(@pitch)
    else
      flash.now[:alert] = "You must fill in all fields"
      render :new
    end
  end

  def show
    @pitch = Pitch.find_by_id(params[:id])
    if @pitch.nil?
      flash.notice = "Sorry, could not find the pitch you're looking for"
      redirect_to pitches_path
    end
  end

  def destroy
    pitch = Pitch.find(params[:id])
    pitch.destroy!
    flash.notice = "Deleted pitch"
    redirect_to pitches_path
  end

  def song_select
    @pitch = Pitch.find_by_id(params[:id])
    @songs = Song.all
    if @pitch.nil?
      flash.notice = "Sorry, there seems to be a problem, please re-enter your pitch"
      render :new
    end
  end

  protected
  def pitch_params
    params.require(:pitch).permit(:pitch_to, :pitch_notes, :email, :subject, :message)
  end

end