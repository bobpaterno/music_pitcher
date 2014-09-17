class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
  end

  def show
    @pitch = Pitch.find_by_id(params[:id])
    if @pitch.nil?
      flash.notice = "Sorry, could not find the pitch you're looking for"
      redirect_to pitches_path
    end
  end

end