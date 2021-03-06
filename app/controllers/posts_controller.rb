class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find params.require(:user_id)
    @posts = Post.where(author_id: @user_id).includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user_id = params[:user_id]
    @comments = Comment.all.where("post_id = #{params[:id]}")
    @comment = Comment.all.where("post_id = #{params[:id]}, user_id = #{params[:user_id]}")
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @post = Post.new(author: @current_user, title: params[:post][:title], text: params[:post] [:text])
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Post was successfully created.'
    else
      flash[:notice] = 'Something went wrong!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    user_id = @post.author_id
    @post.destroy
    flash[:notice] = 'Post was successfully deleted.'
    redirect_to "/users/#{user_id}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
