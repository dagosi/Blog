class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show, :destroy]
  
  NUM_ELEMENTS_PAGINATION = 5

  def index
    @posts = Post.paginate(page: params[:page], per_page: NUM_ELEMENTS_PAGINATION)
      .order('created_at DESC')

    session[:page] = params[:page]
   end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @next_post_pagination = 
      @post.next_post_pagination(NUM_ELEMENTS_PAGINATION, session[:page])
    respond_to :js
  end
end
