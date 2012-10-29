class CommentsController < ApplicationController
 
  http_basic_authenticate_with name: "daniel", password: "dagosi89*", only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    
    if @comment.save
      respond_to :js
    else
      flash[:errors] = @comment.errors
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to :js
  end
end
