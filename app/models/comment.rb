class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :comments_counter

  def self.count_all
    count
  end

  def comments_counter
    post = Post.find(post_id)
    post.increment!(:comments_counter)
  end
end
