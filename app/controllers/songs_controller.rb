class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path, notice: "Song created"
    else
      flash.now[:alert] = "Song could not be created"
      render :new
    end
  end

  def edit
    @song = Song.find_by_id(params[:id])
  end

  def update
    @song = Song.find_by_id(params[:id])
    if @song.update(song_params)
      redirect_to songs_path
    else
      flash.now[:alert] = "Could not update song: #{@song.title}"
      render :show
    end
  end

  def show
    @song = Song.find_by_id(params[:id])
    if @song.nil?
      flash.notice = "Song could not be found"
      redirect_to songs_path
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy!
    flash.notice = "Deleted song"
    redirect_to songs_path
  end

  protected
  def song_params
    params.require(:song).permit(:title, :artist, :genre, :description, :audiofile)
  end
end