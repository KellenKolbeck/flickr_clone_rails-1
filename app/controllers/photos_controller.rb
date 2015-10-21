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
    @photo.user_id = current_user.id
    @photo.content_tags.new(tag_params)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @ContentTag = ContentTag.all
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

private

  def photo_params
    params.permit(:description, :image)
  end

  def tag_params
    params.permit(:name)
  end

end
