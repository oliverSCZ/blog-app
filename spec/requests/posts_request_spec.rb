require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts#index' do
    before(:example) { get '/users/:user_id/posts' }

    it 'responds correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correctly' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text' do
      expect(response.body).to include('List of all posts of the specific user')
    end
  end

  describe 'GET posts#show' do
    before(:example) { get '/users/:user_id/posts/:post_id' }

    it 'responds correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correctly' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text' do
      expect(response.body).to include('This is the page where you will see the specific post and all the comments for that post')
    end
  end
end