class Api::V1::FavoritesController < ApplicationController
  def index
    @favorite_songs = current_user.favorites.where(favoritable_type: "Song").map(&:favoritable)
    @favorite_artists = current_user.favorites.where(favoritable_type: "Artist").map(&:favoritable)
    @favorite_albums = current_user.favorites.where(favoritable_type: "Album").map(&:favoritable)
  end

  def create
    @favoritable = current_user.favorites.new
    @favoritable.favoritable_type = params[:favoritable_type]
    @favoritable.favoritable_id = params[:id]
    @favoritable.save
    head :ok
  end

  def destroy
    @favoritable = current_user.favorites.find_by(favoritable_type: params[:favoritable_type], favoritable_id: params[:id])
    @favoritable.destroy
    head :ok
  end
end
