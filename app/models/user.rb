class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  def self.three_most_recent_post
    i = Post.ids.length
    (i - 2..i).each do |_a|
      puts Post.find_by(id: i).text
      i -= 1
    end
  end
end
