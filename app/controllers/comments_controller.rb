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

private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
