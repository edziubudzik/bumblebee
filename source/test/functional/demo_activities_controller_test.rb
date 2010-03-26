require 'test_helper'

class DemoActivitiesControllerTest < ActionController::TestCase
  test "should get show XML" do
    activity = Factory(:demo_activity, :demo_id => demo.id)
    
    get :show, :project_id => project.id, :demo_id => demo.id, :id => activity.id, :format => "xml"
    assert_response :success
    assert_equal assigns(:demo_activity), activity
  end
  
  test "should render nothing in show action" do
    activity = Factory(:demo_activity, :demo_id => demo.id)
    
    get :show, :project_id => project.id, :demo_id => demo.id, :id => activity.id
    assert_response :success
    assert_template nil
  end
  
  test "should redirect to show action after creating" do
    post :create, :project_id => project.id, :demo_id => demo.id, 
      :demo_activity => { :url => "http://test.pl", :method => "get"}
      
    assert_redirected_to project_demo_demo_activity_url(
      :project_id => project.id, :demo_id => demo.id, :id => assigns(:demo_activity))
  end

  private
  
    def project
      @project ||= Factory(:project)
    end
    
    def demo
      @demo ||= Factory(:demo, :project_id => project.id)
    end
end
