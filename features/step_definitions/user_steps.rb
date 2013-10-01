require 'fabrication'

When(/^he logs in with password "(.*?)"$/) do |password|
  visit login_path
  fill_in :name, with: @user.name
  fill_in :password, with: password
  click :login
end

