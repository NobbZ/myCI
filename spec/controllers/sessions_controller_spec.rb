require 'spec_helper'

describe SessionsController do
  describe '#new' do
  end

  describe '#create' do
    context 'with existing user' do
      it 'should set current_user' do
        user = Fabricate :user
        post :create, {name: user.name, password: user.password}
        expect(session[:current_user]).to eq user.id
      end
    end

    context 'with not existing user' do
      let(:user) { Fabricate.build :user }
      before(:each) { post :create, {name: user.name, password: user.password} }

      it { flash.to_hash.should have_key :alert }

      it { flash[:alert].should eq "Couldn't log in" }

      it { session[:current_user].should be_nil }

      it { should render_template :new }
    end
  end
end