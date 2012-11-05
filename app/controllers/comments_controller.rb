class CommentsController < ApplicationController
 
  before_filter :authenticate_user!
  respond_to :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.commenter = current_user.username

    if @comment.save
      flash.clear
    else
      flash[:errors] = @comment.errors
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  end
end
