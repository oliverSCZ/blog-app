class CommentsController < ApplicationController
  before_action :find_post
  def new
    @comment = Comment.new
  end

  def create
    @current_user = User.find(params[:user_id]).inspect

    @current_post = Post.find(params[:post_id])
    @comment.user_id = @current_user.id

    @comment = Comment.new(post: @current_post, author: @current_user, text: params[:comment][:text])

    if @comment.save
      flash[:notice] = 'Comment created!'
      redirect_to user_posts_path({ id: @post.id })
    else
      flash[:notice] = 'Comment was not created.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to root_path, notice: 'Comment Deleted!'
  end

  private

  def comment_params
    params.permit(:text)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
