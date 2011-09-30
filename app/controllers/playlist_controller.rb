class PlaylistController < ApplicationController

  def index

  end

  def search
    @songs = Song.search(params[:term], :limit => 5)
    render :json => @songs.to_json
  end

end
