class UserTagsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @users = User.all
    @user_tag = UserTag.new
  end

  def edit
    @photo = Photo.find(params[:photo_id])
    @user_tag = UserTag.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:photo_id])
      @user_tag = UserTag.find(params[:id])
    if @user_tag.update(user_tag_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @user_tag = UserTag.find(params[:id])
    if @user_tag.destroy
      redirect_to root_path()
    else
      render :edit
    end
  end

private

  def content_tag_params
    params.require(:user_tag).permit(:username)
  end
end
