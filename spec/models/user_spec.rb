require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Nelly', posts_counter: 8) }

  before(:each) { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -8
    expect(subject).to_not be_valid
  end

  context 'Last_three method' do
    it ' should return last three posts' do
      expect(subject.three_most_recent_post.count).to be(0)
    end
  end
end
