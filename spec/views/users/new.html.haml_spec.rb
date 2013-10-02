require 'rspec'

describe 'users/new' do
  describe 'signup form' do

    before do
      assign :user, User.new
      render
    end

    subject { rendered }

    it { should have_selector 'form#new_user' }

    it { should have_selector 'input#user_name[type=text]' }

    it { should have_selector 'input#user_email[type=email]' }

    it { should have_selector 'input#user_password[type=password]' }

    it { should have_selector 'input#user_password_confirmation[type=password]' }

    it { should have_selector 'input#signup[type=submit]' }
  end
end