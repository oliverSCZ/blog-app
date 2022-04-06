class PostsController < ApplicationController
  def index
    @user_id = User.find params.require(:user_id)
    @user = @user_id
    @user_posts = Post.where(author_id: @user_id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
