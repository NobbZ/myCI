require 'rspec'

describe 'users/new' do

  it 'should show a signup form' do
    assign :user, User.new

    render

    expect(rendered).to have_selector 'form#new_user'
    expect(rendered).to have_selector 'input#user_name[type=text]'
    expect(rendered).to have_selector 'input#user_email[type=email]'
    expect(rendered).to have_selector 'input#user_password[type=password]'
    expect(rendered).to have_selector 'input#user_password_confirmation[type=password]'
    expect(rendered).to have_selector 'input#signup[type=submit]'
  end
end