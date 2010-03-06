Factory.define :stage_type do |st|
  st.sequence(:name) { |n| "Stage #{n}" }
  st.sequence(:position) { |n| n }
end