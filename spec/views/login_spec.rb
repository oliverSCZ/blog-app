require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before :all do

    visit destroy_user_session_path
    @first_user = User.find_by(name: 'Tom')
    if @first_user.nil?
      @first_user = User.create(name: 'Tom', photo: 'https://via.placeholder.com/300.png/09f/fff', bio: 'User s bio', password: '222555',
                                email: 'tom@example.com', confirmed_at: "2022-04-16 10:14:43.057417")
    end
  end

  describe 'Login' do
    before :all do
      User.create(name: 'Oli', photo: 'https://via.placeholder.com/300.png/09f/fff', password: '333555', email: 'oli@example.com' , confirmed_at: "2022-04-16 10:14:43.057417")
      User.create(name: 'Dante', photo: 'https://via.placeholder.com/300.png/09f/fff', password: '4444555', email: 'dante@example.com', confirmed_at: "2022-04-16 10:14:43.057417")
    end

    before :each do
      visit new_user_session_path
    end

    it 'I can see the username and password inputs and the "Submit" button' do
      expect(page).to have_field('user[email]')
      expect(page).to have_field('user[password]')
      expect(page).to have_selector(:link_or_button, 'Log in')
    end

    it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
        click_on 'Log in'
        expect(page).to have_content("Invalid Email or password.")
    end

    it 'When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error.' do
      fill_in 'Email', with: 'tom@example.com'
      fill_in 'Password', with: '2225554'
      click_on 'Log in'
      expect(page).to have_content("Invalid Email or password.")
    end

    it 'When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page.' do
        fill_in 'Email', with: 'tom@example.com'
        fill_in 'Password', with: '222555'
        click_on 'Log in'
        expect(page).to have_content("Signed in successfully.")
      #expect(page).to have_current_path("/")
    end
  end
end