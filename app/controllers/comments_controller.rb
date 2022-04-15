class CommentsController < ApplicationController
  before_action :find_post
  def new
    @comment = Comment.new
  end

  def create
    @current_post = Post.find(params[:post_id])

    @comment = Comment.new(post: @current_post, author: current_user, text: params[:comment][:text])

    if @comment.save
      flash[:notice] = 'Comment created!'
      redirect_to "/users/#{current_user.id}/posts/#{@current_post.id}", notice: 'Saved successfully'
    else
      flash[:notice] = 'Comment was not created.'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to "/users/#{current_user.id}/posts/#{comment.post_id}", notice: 'Comment deleted successfully'
  end

  private

  def comment_params
    params.permit(:text)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
