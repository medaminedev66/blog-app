class PostsController < ApplicationController
  def index
    @posts = Post.all.where(author_id: params[:user_id])
  end

  def show
  end
end
