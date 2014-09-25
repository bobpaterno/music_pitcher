class PitchesController < ApplicationController
  skip_before_action :require_login, only: [:public]

  def index
    @pitches = Pitch.all
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    if @pitch.save
      redirect_to new_pitch_song_selection_path(@pitch)
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

  def choose_song
    @pitch = Pitch.find_by_id(params[:id])
    binding.pry
  end

  def public
    @pitch = Pitch.find_by_id(params[:id])
    if @pitch.nil?
      flash.notice = "Sorry, this pitch is not available"
      redirect_to root_path
    else
      @songs = @pitch.songs
      render layout: false
    end
  end

  protected
  def pitch_params
    params.require(:pitch).permit(:pitch_to, :pitch_notes, :email, :subject, :message)
  end

end