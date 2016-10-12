class PostsController < ApplicationController
  def index
    @posts = Post.list_all
  end
end
