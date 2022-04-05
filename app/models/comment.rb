class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_comment_counter

  def self.update_comment_counter
    Post.increment_counter(:comments_counter, Post.ids)
  end
end
