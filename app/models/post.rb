class Post < ApplicationRecord
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_post_counter

  def self.recent_comments
    Comment.order(created_at: :desc).limit(5)
  end

  def self.update_post_counter
    User.increment_counter(:posts_counter, User.ids)
  end
end
