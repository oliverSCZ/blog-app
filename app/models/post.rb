class Post < ApplicationRecord
  has_many :comments
  has_many :likes, foreign_key: :author_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_counter

  def self.recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
  
  def update_counter
    user = User.find(author_id)
    user.increment!(:posts_counter)
  end
end
