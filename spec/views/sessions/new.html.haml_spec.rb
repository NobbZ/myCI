require 'spec_helper'

describe 'sessions/new' do
  describe 'loginform' do
    before { render }

    subject { rendered }

    it { should have_selector 'form#login' }

    it { should have_selector 'input#name[type=text]' }

    it { should have_selector 'input#password[type=password]' }

    it { should have_selector 'input#login[type=submit]' }

  end
end
