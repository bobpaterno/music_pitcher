class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def show
    @song = Song.find_by_id(params[:id])
    if @song.nil?
      flash.notice = "Song could not be found"
      redirect_to songs_path
    end
  end
end