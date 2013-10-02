require 'fabrication'

def login(username, password)
  visit login_path
  fill_in :name, with: username
  fill_in :password, with: password
  click_on :login
end

Given(/^I am logged in$/) do
  @user = Fabricate :user
  login(@user.name, @user.password)
end

Given(/^the following User\-template$/) do |table|
  user_data = table.rows_hash
  @user = Fabricate.build :user, user_data
end

When(/^he logs in with password "(.*?)"$/) do |password|
  login(@user.name, password)
end

When(/^he signs up$/) do
  visit new_user_path
  fill_in :user_name, with: @user.name
  fill_in :user_password, with: @user.password
  fill_in :user_password_confirmation, with: @user.password_confirmation
  fill_in :user_email, with: @user.email
  click_on :signup
end

Then(/^(I|he) should see "(.*?)"$/) do |x, expected_text|
  should have_content expected_text
end

Then(/^he should be able to sign in$/) do
  login(@user.name, @user.password)
  step "he should see \"Welcome #{@user.name}\""
end

