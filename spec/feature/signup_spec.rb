require 'rails_helper'

RSpec.describe 'the signup process', type: :feature, js: true do
  scenario 'page to create a new user' do
    visit new_user_path
    sleep(1)
    fill_in 'Username', with: 'user6'
    sleep(2)
    fill_in 'Email', with: 'user6@gmail.com'
    sleep(2)
    fill_in 'Passord', with: 'password'
    sleep(2)
    fill_in 'Confirm Password', with: 'password'
    sleep(2)
    click_on 'Sign up'
    expect(page).to have_content 'user6'
  end
end
