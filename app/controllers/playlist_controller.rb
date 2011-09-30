class PlaylistController < ApplicationController
  respond_to :html, :json

  def index
    @playlist = Request.all
    respond_with @playlist
  end

  def search
    @songs = Song.search(params[:term], :limit => 5)
    respond_with @songs
  end

  def create
    # song = Song.find(params[:request][:song_id])
    # request = Request.find_or_create_for_song(song)
    request = Request.create(params[:request].slice(:song_id))
    respond_with request
  end

end
