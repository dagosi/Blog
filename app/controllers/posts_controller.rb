class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:show]
  
  NUM_ELEMENTS_PAGINATION = 5
  
  
  def index
    @user = current_user
    @posts = @user.posts.paginate(page: params[:page], per_page: NUM_ELEMENTS_PAGINATION)
      .order('created_at DESC')

    session[:page] = params[:page]
   end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = @user.posts.build
  end
  
  def edit
    @user = current_user
    @post = @user.posts.find(params[:id])
  end

  def create
    @user = current_user
    @post = @user.posts.build(params[:post])

    if @post.save
      redirect_to [@user, @post], notice: 'Post was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = current_user
    @post = @user.posts.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to [@user, @post], notice: 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.destroy
    @next_post_pagination = 
      @post.next_post_pagination(NUM_ELEMENTS_PAGINATION, session[:page])
    respond_to :js
  end
end
