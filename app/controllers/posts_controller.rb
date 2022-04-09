class PostsController < ApplicationController
  def index
    @user_id = User.find params.require(:user_id)
    @user = @user_id
    @user_posts = Post.where(author_id: @user_id).includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user_id = params[:user_id]
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
      redirect_to user_posts_path({ id: @post.id }), notice: 'Post was successfully created.'
    else
      flash[:notice] = 'Something went wrong!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end