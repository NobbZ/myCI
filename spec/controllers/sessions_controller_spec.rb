require 'spec_helper'

describe SessionsController do
  describe '#new' do
  end

  describe '#create' do
    it 'should set current_user' do
      user = Fabricate :user
      post :create, {name: user.name, password: user.password}
      expect(session[:current_user]).to eq user.id
    end
  end
end