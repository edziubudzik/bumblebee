Factory.define :project do |p|
  p.sequence(:name) {|n| "Project #{n}" }
end