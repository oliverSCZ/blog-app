class ApiController < ApplicationController
    def user_posts
        @user = User.find(params[:user_id])
        @posts = @user.posts

        json_response(@posts)
    end

    def user_comments
        @user = User.find(params[:user_id])
        @comments = @user.posts.find(params[:post_id]).comments
        
        json_response(@comments)
    end
end