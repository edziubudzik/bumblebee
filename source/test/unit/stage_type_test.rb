require 'test_helper'

class StageTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "new stage type should be positioned at the end" do
    stage_type = StageType.create(:name => 'Etap 1')
    
    assert_equal StageType.count, stage_type.position
  end
end
