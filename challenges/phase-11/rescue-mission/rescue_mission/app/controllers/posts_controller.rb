class PostsController < ApplicationController
  def index
    @posts = Post.list_all
  end

  def show
    @post = Post.find(params[:id])
  end
end
