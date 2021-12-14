class CommentsController < ApplicationController
  def create
    @publisher = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment].permit(:Text))
    @comment.Author_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      @comment.update_comments_counter
      flash[:notice] = 'Comment successfully added'
    else
      flash[:notice] = 'Something went wrong'
    end
    redirect_to user_post_path(@publisher, @post)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = 'The Comment was successfully destroyed.'
    redirect_to user_post_url(User.find(params[:user_id]), Post.find(params[:post_id]))
  end
end
