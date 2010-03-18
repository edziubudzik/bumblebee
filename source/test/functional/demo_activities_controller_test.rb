require 'test_helper'

class DemoActivitiesControllerTest < ActionController::TestCase
  test "should get show XML" do
    activity = Factory(:demo_activity, :demo_id => demo.id)
    
    get :show, :project_id => project.id, :demo_id => demo.id, :id => activity.id, :format => "xml"
    assert_response :success
    assert_equal assigns(:demo_activity), activity
  end

  private
  
    def project
      @project ||= Factory(:project)
    end
    
    def demo
      @demo ||= Factory(:demo, :project_id => project.id)
    end
end
