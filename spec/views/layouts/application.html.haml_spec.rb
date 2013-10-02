require 'spec_helper'

describe 'layouts/application' do
  context 'a user is logged in' do
    let(:user) { Fabricate :user }

    before(:each) do
      # TODO: find a way to not be brutal to Object…
      Object.any_instance.stub(:current_user) { user }
      render
    end

    subject { rendered }

    it { should have_selector '#user_box' }
    it { should have_content user.name }

    it { should have_content 'logout' }
    it { should have_selector 'a#logout[data-method=delete]' }

    it { should_not have_content 'Sign In' }
    it { should_not have_selector 'a#signin' }
    it { should_not have_content 'Sign Up' }
    it { should_not have_selector 'a#signup' }
  end

  context 'no user is logged in' do
    before(:each) do
      # TODO: find a way to not be brutal to Object…
      Object.any_instance.stub(:current_user) { nil }
      render
    end
    subject { rendered }

    it { should have_selector '#user_box' }

    it { should_not have_content 'logout' }
    it { should_not have_selector 'a#logout[data-method=delete]' }

    it { should have_content 'Sign In' }
    it { should have_selector 'a#signin' }
    it { should have_content 'Sign Up' }
    it { should have_selector 'a#signup' }
  end
end