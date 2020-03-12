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

      visit signin_path
      fill_in 'Email', with: 'user6@gmail.com'
      fill_in 'Password', with: 'password'
      sleep(2)
      click_on 'Sign in'
    end

    scenario 'create an event' do
      visit new_event_path
      sleep(1)
      fill_in 'Event title', with: 'My birthday party'
      sleep(1)
      fill_in 'Event date', with: '03/13/2020'
      sleep(1)
      fill_in 'More detail about this event', with: 'Come with your family'
      sleep(1)
      fill_in 'Event location', with: 'My house'
      sleep(1)
      click_on 'Add event'
      expect(page).to have_content 'Title of this event: My birthday party'
    end
  end
end
