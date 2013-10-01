require 'spec_helper'

describe UsersController do
  describe '#new' do
    before(:each) { get :new }

    it { should render_template 'users/new' }

    it { assigns[:user].should be_a_new User }
  end
end