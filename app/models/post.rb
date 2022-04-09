class Post < ApplicationRecord
  has_many :comments, foreign_key: :author_id
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    Comment.order(created_at: :desc).limit(5)
  end

  def update_counter
    user = User.find(author_id)
    user.increment!(:posts_counter)
  end
end
