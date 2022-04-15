class LikesController < ApplicationController
  before_action :find_post, :find_user

  def create
    @post = Post.find_by_id(params[:post_id])
    @like = Like.new(post_id: @post.id, author_id: @post.author_id)
    if @like.save
      redirect_to user_posts_url(@user, @post), notice: 'Your like has been recorded'
    else
      flash.now[:notice] = 'Like could not be added'
    end
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
