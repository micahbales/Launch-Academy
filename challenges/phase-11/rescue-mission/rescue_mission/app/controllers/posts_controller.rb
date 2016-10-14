class PostsController < ApplicationController
  def index
    @posts = Post.list_all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.list_all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Article was successfully created.'
    else
      flash[:alert] = "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
      render action: 'new'
      flash[:alert] = nil
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Article was successfully updated.'
    else
      flash[:alert] = "Titles must be a minimum of 40 characters; descriptions a minimum of 150"
      render action: 'edit'
      flash[:alert] = nil
    end
  end

  def destroy

    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post has been deleted!"
    redirect_to posts_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
