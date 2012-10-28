class CommentsController < ApplicationController
 
  http_basic_authenticate_with name: "daniel", password: "dagosi89*", only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: 'The comment was successfully deleted.'
  end
end
