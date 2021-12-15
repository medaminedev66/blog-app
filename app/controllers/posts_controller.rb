class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
    @comments = Comment.all.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    @post.author_id = current_user.id
    if @post.save
      @post.update_counter
      flash[:notice] = 'Post successfully created'
      redirect_to user_post_path(id: @post.id, user_id: @post.author_id)
    else
      flash[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  def like
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @like = Like.create(post_id: @post.id, Author_id: current_user.id)
    @like.update_likes_counter
    flash[:notice] = 'Like successfully added'
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'The Post was successfully destroyed.'
    redirect_to user_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
