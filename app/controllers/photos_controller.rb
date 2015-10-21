class PhotosController < ApplicationController

  before_action :authenticate_user!

  def index
    @photos = Photo.all
    @contenttags = ContentTag.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.author = current_user.username
    @photo.user_id = current_user.id
    tags = tag_params[:name].split(" ")
    tags.each do |tag|
      @photo.content_tags.new(name: tag)
    end
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
    binding.pry
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

private

  def photo_params
    params.require(:photo).permit(:description, :image)
  end

  def tag_params
    params.permit(:name)
  end

end
