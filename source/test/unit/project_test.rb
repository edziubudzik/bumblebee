require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should validate" do
    project_with_no_name = Factory.build(:project, :name => '')
    project_with_too_long_name = Factory.build(:project, :name => 'Za długa nazwa projektu. 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111' )
    
    assert !project_with_no_name.save, "Zapisano projekt bez nazwy"
    assert !project_with_too_long_name.save, "Zapisano projekt ze zbyt długą nazwą"
  end
end
