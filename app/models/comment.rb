class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  
  validates :text, presence: true, length: { in: 1..250 }
  
  after_save :comments_counter
  private

  def comments_counter
    post = Post.find(post_id)
    post.increment!(:comments_counter)
  end
end
