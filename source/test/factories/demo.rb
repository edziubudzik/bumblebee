Factory.define :demo do |d|
  d.sequence(:name) { |n| "Demo \##{n}" }
  d.sequence(:description) { |n| "Demo \##{n} Description" }
  d.sequence(:url) { |n| "http://demo.pl/demo_#{n}" }
  d.association :event, :factory => :event
end