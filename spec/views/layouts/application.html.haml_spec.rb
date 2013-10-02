require 'spec_helper'

describe 'layouts/application' do
  describe 'logout' do
    it 'should have a logout link' do
      render
      rendered.should have_content 'logout'
      rendered.should have_selector 'a#logout[data-method=delete]'
    end
  end
end