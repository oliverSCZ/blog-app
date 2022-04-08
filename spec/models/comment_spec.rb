require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  post = Post.create(title: 'Hello Microverse', comments_counter: 0)
  subject { Comment.new(text: 'Comment', author_id: 1, post_id: post.id) }

  before(:each) { subject.save }

  context 'post.increment! method' do
    it 'increments a posts comment counter' do
      post.increment!(:comments_counter)
      expect(post.comments_counter).to eql 1
    end
  end
end