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
end
