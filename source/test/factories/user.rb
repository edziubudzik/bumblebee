Factory.define :user do |u|
  u.sequence(:email) { |n| "email#{n}@example.com" }
  u.password "secret"
  u.password_confirmation "secret"
end