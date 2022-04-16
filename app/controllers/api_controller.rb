class ApiController < ApplicationController
    

    def user_posts
        @user = current_user
        @posts = @user.posts

        json_response(@posts)
    end

    def user_comments
        @user = current_user
        @comments = @user.posts.find(params[:post_id]).comments
        
        json_response(@comments)
    end

    def create_comment
        @user = current_user
        @post = Post.find(params[:post_id])
        @comment = Comment.create(post: @post, author: @user, text: params[:text])

        render json: {status: "Comment created successfully"}
    end
end