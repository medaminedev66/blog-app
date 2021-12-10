class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.all.where(author_id: params[:user_id])
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @comments = Comment.all.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = params[:user_id]
    if @post.save
      @post.update_counter
      flash[:success] = 'Object successfully created'
      redirect_to user_post_path(id: @post.id, user_id: @post.author_id)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def like
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @like = Like.create(post_id: @post.id, Author_id: current_user.id)
    @like.update_likes_counter
    redirect_to user_post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
