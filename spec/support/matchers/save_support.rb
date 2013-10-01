RSpec::Matchers.define :save do
  match do |model|
    model.save
  end
end