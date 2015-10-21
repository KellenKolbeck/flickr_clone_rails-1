class PhotosController < ApplicationController

  before_action :authenticate_user!

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.author = current_user.username
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

private

  def photo_params
    params.require(:photo).permit(:description, :image)
  end

end
