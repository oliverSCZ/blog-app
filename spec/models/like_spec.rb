require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Harriet')
  post = Post.create(id: 1, title: 'Hello Microverse', likes_counter: 0)
  subject { Like.new(author_id: user.id, post_id: post.id) }

  before(:each) { subject.save }

  context 'post.increment! method' do
    it 'updates likes counter' do
      post.increment!(:likes_counter)
      expect(post.likes_counter).to eql 1
    end
  end
end