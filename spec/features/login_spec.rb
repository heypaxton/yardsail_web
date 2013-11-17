require 'spec_helper'

feature 'Logging in' do
  before(:each) do
    visit root_path
  end

  scenario 'guest user' do
    page.should have_content 'Sign in'
    page.should have_content 'Sign up'
    page.should_not have_content 'Sign out'
  end

  scenario 'unregistered user' do
    visit_signup_and_signup('newuser@newuser.com', 'password', 'password')
    page.should have_content 'Welcome! You have signed up successfully.' 
  end
  
  scenario 'unregistered user with invalid email' do
    visit_signup_and_signup('invalidemail', 'password', 'password')
    page.should have_content 'Email is invalid'
  end
 
  scenario 'existing user' do
    @user = FactoryGirl::build(:user)
    @user.save!
    visit_signin_and_signin(@user.email, @user.password)
    page.should have_content 'Signed in successfully.'
  end

  scenario 'incorrect email and password' do
    visit_signin_and_signin('invalid@invalid.com', 'invalid')
    page.should have_content 'Invalid email or password'
  end
end

def visit_signin_and_signin(email, password)
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in' 
end

def visit_signup_and_signup(email, password, password_confirmation)
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end
