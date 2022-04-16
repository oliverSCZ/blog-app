require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :all do

    visit destroy_user_session_path
    @first_user = User.find_by(name: 'Tom')
    if @first_user.nil?
      @first_user = User.create(name: 'Tom', photo: 'https://via.placeholder.com/300.png/09f/fff', bio: 'User s bio', password: '222555',
                                email: 'tom@example.com')
    end
  end

  describe 'index' do
    before :all do
      User.create(name: 'Oli', photo: 'https://via.placeholder.com/300.png/09f/fff', password: '333555', email: 'oli@example.com')
      User.create(name: 'Dante', photo: 'https://via.placeholder.com/300.png/09f/fff', password: '4444555', email: 'dante@example.com')
    end

    before :each do
      visit users_path
    end

    it 'shows the username of all users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Oli')
      expect(page).to have_content('Dante')
    end

    it 'See the profile picture for each user' do
      all_images = page.all('img')
      expect(all_images.count).to eq(3)
    end

    it 'See the number of posts each user has written' do
      expect(page).to have_content("Number of post: 0")
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_link 'Tom'
      expect(page).to have_current_path(user_path('1'))
    end
  end

  describe 'show' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: 'tom@example.com'
      fill_in 'Password', with: '222555'
      click_button 'Log in'

     
      @post1 = Post.find_by(title: 'Post #1')
      @post2 = Post.find_by(title: 'Post #2')
      @post3 = Post.find_by(title: 'Post #3')

      if @post1.nil?
        @post1 = Post.create(author:  @first_user, title: 'Post #1', text: 'Post #1', comments_counter: 0, likes_counter: 0)
      end

      if @post2.nil?
        @post2 = Post.create(author:  @first_user, title: 'Post #2', text: 'Post #2', comments_counter: 0, likes_counter: 0)
      end

      if @post3.nil?
        @post3 = Post.create(author:  @first_user, title: 'Post #3', text: 'Post #3', comments_counter: 0, likes_counter: 0)
      end
      
    end
    before :each do
      visit "/users/#{@first_user.id}"
    end
	# let!(:create_post) { Post.create!(post_params) }
    it 'shows the correct path' do
      expect(page).to have_current_path(user_path(@first_user.id))
    end

    it 'shows the user profile picture' do
      all_images = page.all('img')
      expect(all_images.count).to eq(1)
    end

    it 'shows the user username' do
      expect(page.find('h4', text: 'Tom')).to be_truthy
    end

    # it 'shows the user post count' do
    #   expect(page).to have_content("Posts: #{@first_user.posts.count}")
    # end

    # it 'shows the user bio' do
    #   expect(page).to have_content(@first_user.bio)
    # end

    # it 'shows the user\'s first three posts' do
    #   expect(page.find_all('div', class: 'post-card').count).to eq(3)
    # end

    # it 'shows the user\'s posts when any post is clicked' do
    #   click_link @post1.title
    #   expect(page).to have_current_path(user_posts_path(@first_user))
    # end

    # it 'shows the post details when any post is clicked in the post index page' do
    #   click_link @post1.title
    #   click_link @post1.title
    #   expect(page).to have_current_path(user_post_path(@first_user, @post1))
    # end
  end
end

# RSpec.describe Post, type: :model do 
# 	describe "validations" do 
# 		let(:post){FactoryBot.build(:post)}
# 		it "should have a title" do
# 			post.title = nil
# 			expect(post).to_not be_valid
# 		end
# 	end
# end