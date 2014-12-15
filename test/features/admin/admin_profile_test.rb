require 'test_helper'

class AdminProfileTest < Capybara::Rails::TestCase
  def setup
    create(:app_settings)
    create(:user, username: 'Guest')
    create(:admin, name: 'Super Admin', email: 'admin@test.com', password: 'password')
    visit root_path
    click_link 'Log in'
    click_link 'Admin sign in'
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end

  test 'admins can edit their profile information and passwords' do
    visit admin_profile_path
    fill_in 'Name', with: 'Mr Fox'
    fill_in 'New password', with: 'super secret'
    fill_in 'New password confirmation', with: 'super secret'
    click_button 'update profile'
    assert_content page, 'Your profile has been updated'
    click_link 'Sign out'
    click_link 'Log in'
    click_link 'Admin sign in'
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: 'super secret'
    click_button 'Sign in'
    assert_content page, 'Welcome to your dashboard'
  end
end