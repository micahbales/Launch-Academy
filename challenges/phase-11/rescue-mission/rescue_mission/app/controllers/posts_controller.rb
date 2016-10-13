class PostsController < ApplicationController
  def index
    @posts = Post.list_all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Article was successfully created.'
    else
      flash[:error] = "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
      render action: 'new'
      flash[:error] = nil
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
