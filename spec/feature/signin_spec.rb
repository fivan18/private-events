require 'rails_helper'

RSpec.describe 'the signin process', type: :feature, js: true do
  feature 'create a user' do
    before(:each) do
      visit new_user_path
      fill_in 'Username', with: 'user6'
      fill_in 'Email', with: 'user6@gmail.com'
      fill_in 'Passord', with: 'password'
      fill_in 'Confirm Password', with: 'password'
      click_on 'Sign up'
      find('a[href*="logout"]').click
    end

    scenario 'sign in process' do
      visit signin_path
      fill_in 'Email', with: 'user6@gmail.com'
      fill_in 'Password', with: 'password'
      sleep(2)
      click_on 'Sign in'
      expect(page).to have_content 'user6'
    end
  end
end
