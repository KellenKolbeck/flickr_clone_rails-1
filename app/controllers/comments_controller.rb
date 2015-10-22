class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.new(comment_params)
    @photo.comments.last.author = current_user.username
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @photo = Photo.find(params[:photo_id])
  end

  def update
    @comment = Comment.find(params[:id])
    @photo = Photo.find(params[:photo_id])
    if @comment.update(comment_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to photo_path(photo)
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
