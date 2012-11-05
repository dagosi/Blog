class HomeController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end
end
