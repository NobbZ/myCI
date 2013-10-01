require 'spec_helper'

describe User do
  context 'validation' do
    [:name, :email, :password, :password_confirmation].each do |attribute|
      context "empty #{attribute.to_s}" do
        let(:user) { Fabricate.build :user, attribute => '' }

        it { user.should_not be_valid }

        it { user.should_not save }

        it { user.should have_at_least(1).errors_on (attribute == :password_confirmation) ? :password : attribute }
      end
    end
  end
end
