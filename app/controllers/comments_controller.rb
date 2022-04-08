class CommentsController < ApplicationController
  before_action :find_post
  def new
    @comment = Comment.new
  end

  def create
    @current_user = User.find(params[:user_id])

    @current_post = Post.find(params[:post_id])

    @comment = Comment.new(post: @current_post, author: @current_user, text: params[:comment][:text])

    if @comment.save
      redirect_to user_posts_url({ id: @post.id }), flash: { success: 'Your comment was saved' }
    else
      flash.now => { error: 'Something went wrong with your comment' }
      render :new
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
