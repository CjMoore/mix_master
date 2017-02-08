class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save

    redirect_to playlist_path(@playlist)
  end

  def show
    # @playlist = Playlist.find(params[:id])
  end

  def edit
    # @playlist = Playlist.find(params[:id])
    @songs = Song.all
  end

  def update
    # @playlist = Playlist.find(params[:id])
    @playlist.update_attributes(playlist_params)

    redirect_to @playlist
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

end
