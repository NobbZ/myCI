require 'spec_helper'

describe SessionsController do
  describe '#new' do
    before(:each) { get :new }

    it { should render_template :new }
  end

  describe '#create' do
    before(:each) { post :create, {name: user.name, password: user.password} }

    context 'with existing user' do
      let(:user) { Fabricate :user }

      it { session[:current_user].should eq user.id }

      it { flash.to_hash.should have_key :notice }

      it { should redirect_to root_path }
    end

    context 'with not existing user' do
      let(:user) { Fabricate.build :user }

      it { flash.to_hash.should have_key :alert }

      it { flash[:alert].should eq "Couldn't log in" }

      it { session[:current_user].should be_nil }

      it { should render_template :new }
    end
  end

  describe '#destroy' do
    let(:user) { Fabricate :user }

    before(:each) { delete :destroy, nil, {current_user: user.id} }

    it { flash.to_hash.should have_key :notice }
    it { flash[:notice].should eq 'Logged out successfully' }
    it { session[:current_user].should be_nil }
    it { should redirect_to root_path }
  end
end