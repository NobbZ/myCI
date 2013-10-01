require 'spec_helper'

describe UsersController do
  describe '#new' do
    before(:each) { get :new }

    it { should render_template :new }

    it { assigns[:user].should be_a_new User }
  end

  describe '#create' do
    context 'valid user' do
      let(:user) { Fabricate.attributes_for :user }
      before(:each) { post :create, user: user }

      it { should redirect_to root_path }

      it { flash.to_hash.should have_key :notice }

      it { flash[:notice].should match_regex /Account '#{user[:name]}' created/ }

      it { flash[:notice].should match_regex /Please .*sign in.* to use your account/ }

      it { User.find_by_name(user[:name]).should be_a User }
    end

    context 'invalid user' do
      context 'with empty username' do
        let(:user) { Fabricate.attributes_for :user, name: '' }
        before(:each) { post :create, user: user }

        it { should render_template :new }

        it { flash.to_hash.should have_key :alert }

        it { flash.to_hash.should_not have_key :notice }

        it { flash[:alert].should eq 'Account wasn\'t created' }

        it { User.find_by_name(user[:name]).should be_nil }
      end

      context 'with empty password confirmation' do
        let(:user) { Fabricate.attributes_for :user, password_confirmation: '' }
        before(:each) { post :create, user: user }

        it { should render_template :new }

        it { flash.to_hash.should have_key :alert }

        it { flash[:alert].should eq 'Account wasn\'t created' }

        it { User.find_by_name(user[:name]).should be_nil }
      end
    end
  end
end