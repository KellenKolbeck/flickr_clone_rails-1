class ContentTagsController < ApplicationController
  def new
    @content_tag = ContentTag.new
  end

  def edit
    @photo = Photo.find(params[:photo_id])
    @content_tag = ContentTag.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:photo_id])
    @content_tag = ContentTag.find(params[:id])
    if @content_tag.update(content_tag_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

private

  def content_tag_params
    params.require(:content_tag).permit(:name)
  end
end
