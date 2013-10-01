Fabricator(:user) do
  name { Fabricate.sequence(:user_name) { |i| "generated_user_#{i}" } }
  email { |attrs| "#{attrs[:name].parameterize}@example.com" }
  password 'secret'
  password_confirmation 'secret'
end
