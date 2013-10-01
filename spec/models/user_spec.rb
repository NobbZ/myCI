require 'spec_helper'

describe User do
  context 'validation' do
    context 'empty username' do
      let(:user) { Fabricate.build :user, name: '' }

      it { user.should_not be_valid }
    end
  end
end
