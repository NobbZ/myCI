require 'rspec'

describe 'users/new' do

  it 'should show a signup form' do
    assign :user, User.new

    render

    rendered.should have_selector 'form#new_user'
    rendered.should have_selector 'input#user_name[type=text]'
    rendered.should have_selector 'input#user_email[type=email]'
    rendered.should have_selector 'input#user_password[type=password]'
    rendered.should have_selector 'input#user_password_confirmation[type=password]'
    rendered.should have_selector 'input#signup[type=submit]'
  end
end