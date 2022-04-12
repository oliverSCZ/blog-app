class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # def show
  #   @user_id = params[:id]
  #   @user = User.find(@user_id)

  #   @user_posts = Post.where(author_id: @user_id)
  # end
  def show
    if params[:id] == 'sign_out'
      sign_out
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

end
