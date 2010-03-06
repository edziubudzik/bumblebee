require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :stage_types
  
  test "should validate" do
    project_with_no_name = Factory.build(:project, :name => '')
    project_with_too_long_name = Factory.build(:project, :name => 'Za długa nazwa projektu. 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111' )
    
    assert !project_with_no_name.save, "Zapisano projekt bez nazwy"
    assert !project_with_too_long_name.save, "Zapisano projekt ze zbyt długą nazwą"
  end
  
  test "should return events of its stages" do
    project = Factory.create(:project)
    
    stage_one = Factory.create(:stage, :stage_type_id => stage_types(:one).id)
    stage_two = Factory.create(:stage, :stage_type_id => stage_types(:two).id)

    stage_one.events<<Factory.build(:event, :time => Time.now)
    stage_one.events<<Factory.build(:event, :time => Time.now + 2.days)
    
    stage_two.events<<Factory.build(:event, :time => Time.now - 3.months)
    stage_two.events<<Factory.build(:event, :time => Time.now + 1.day)

    project.stages<<stage_one
    project.stages<<stage_two
    
    assert_equal project.events.size, 4
    assert project.events[0].time < project.events[1].time &&
      project.events[1].time < project.events[2].time &&
      project.events[2].time < project.events[3].time, 
      "Błędna kolejność wydarzeń"
  end
end
