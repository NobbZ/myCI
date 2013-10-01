require 'fabrication'

When(/^he logs in with password "(.*?)"$/) do |password|
  visit login_path
  fill_in :name, with: @user.name
  fill_in :password, with: password
  click_on :login
end

Then(/^(I|he) should see "(.*?)"$/) do |x, expected_text|
  should have_content expected_text
end

