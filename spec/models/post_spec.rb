require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Harriet', posts_counter: 0)
  subject { Post.new(title: 'Title', text: 'This is the text', author_id: 1, comments_counter: 3, likes_counter: 8) }

  before(:each) { subject.save }

  it 'title must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'commentCounter is an integer' do
    subject.comments_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'commentCounter is greater than or equal to 0' do
    subject.comments_counter = -8
    expect(subject).to_not be_valid
  end

  context 'recent_comments method' do
    it ' should return recent comments' do
      expect(subject.recent_comments.length).to be(0)
    end
  end

  context 'user.increment! method' do
    it 'increments user posts counter' do
      user.increment!(:posts_counter)
      expect(user.posts_counter).to eql 1
    end
  end

  it 'likesCounter is an integer' do
    subject.likes_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'likesCounter is greater than or equal to 0' do
    subject.likes_counter = -8
    expect(subject).to_not be_valid
  end
end
