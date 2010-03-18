require 'test_helper'

class DemosControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index, :project_id => project.id
  #   assert_response :success
  #   assert_not_nil assigns(:demos)
  # end
  # 
  test "should get show" do
    demo = Factory(:demo, :project_id => project.id)
    
    get :show, :project_id => project.id, :id => demo.id
    assert_response :success
    assert_equal assigns(:demo), demo
  end
  
  test "should get browse" do
    demo = Factory(:demo, :project_id => project.id)
    
    get :browse, :project_id => project.id, :id => demo.id
    assert_response :success
    assert_equal assigns(:demo), demo
  end
  
  test "should get new" do
    get :new, :project_id => project.id
    assert_response :success
    assert_not_nil assigns(:demo)
  end
  
  private
  
    def project
      @project ||= Factory(:project)
    end
end
