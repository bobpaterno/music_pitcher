Fabricator(:user) do
  username { sequence(:username) { |i| "user#{i}" } }
  password { "password1" }
end
