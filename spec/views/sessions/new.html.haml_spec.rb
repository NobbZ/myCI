require 'spec_helper'

describe 'sessions/new' do
  it 'should show a loginform' do
    render
    rendered.should have_selector 'form#login'
    rendered.should have_selector 'input#name[type=text]'
    rendered.should have_selector 'input#password[type=password]'
    rendered.should have_selector 'input#login[type=submit]'
  end
end
