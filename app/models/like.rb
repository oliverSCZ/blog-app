class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  after_save :post_like_counter
 
  def post_like_counter
    post = Post.find(post_id)
    post.increment!(:likes_counter)
    # post.update(likes_counter: post.likes.length)
  end
end
