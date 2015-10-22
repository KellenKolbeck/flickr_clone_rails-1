class FavoritesController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @favorite = Favorite.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.photo_id = @photo.id
    if @favorite.save
      redirect_to photo_path(@photo)
    else
      render :index
    end
  end

end
