class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  def self.three_most_recent_post
    i=Post.ids.length
    for a in i-2..i
    puts Post.find_by(id:i).text
    i=i-1
    end
  end
end
