class PostsController < ApplicationController
  def index
    @user_id = User.find(params[:user_id])
    # @user_id = User.find params.require(:user_id)
    @user = @user_id
    @user_posts = Post.where(author_id: @user_id)
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
    if @post.valid?
      @post.save
      redirect_to user_posts_url({ id: @post.id }), flash: { success: 'Your post was saved' }
    else
      flash[:notice] = @post.errors.full_messages.join("\n")
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
