require 'spec_helper'

describe UsersController do
  describe '#new' do
    before(:each) { get :new }

    it { should render_template 'users/new' }

    it { assigns[:user].should be_a_new User }
  end

  describe '#create' do
    context 'valid user' do
      let(:user) { Fabricate.attributes_for :user }
      before(:each) { post :create, user: user }

      it { should redirect_to root_path }

      it { flash.to_hash.should have_key :notice }

      it { flash[:notice].should match_regex /Account '#{user[:name]}' created/ }

      it { flash[:notice].should match_regex /Please .*sign in.* to use your account/}
    end
  end
end