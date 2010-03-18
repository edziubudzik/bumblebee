Factory.define :demo_activity do |da|
  da.sequence(:url) { |n| "http://demo.pl/demo_activity_#{n}" }
  da.sequence(:method) { |n| (%w[get post put delete])[n] }
end