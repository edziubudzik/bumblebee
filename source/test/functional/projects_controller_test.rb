require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  fixtures :stage_types
  
  # Wyświetlanie listy projektów
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end
  
  test "should get show" do
    project = Factory(:project)
    
    get :show, :id => project.id
    assert_response :success
    assert_not_nil assigns(:project)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:project)
  end
  
  test "should get events XML" do
    project = Factory(:project)
    
    stage_one = Factory.create(:stage, :stage_type_id => stage_types(:one).id)

    stage_one.events<<Factory.build(:event, :time => Time.now)
    stage_one.events<<Factory.build(:event, :time => Time.now + 2.days)
    
    project.stages<<stage_one
    
    get :events, :id => project.id, :format => "xml"
    assert_response :success
    assert_not_nil assigns(:project)
    assert_equal assigns(:project).events.size, 2
  end
  
  test "should create project" do
    name = 'Testowy projekt'
    assert_difference('Project.count') do
      post :create, :project => { :name => name }
    end
    
    assert_equal assigns(:project).name, name
    assert_redirected_to project_path(assigns(:project))
  end
  
  test "should get edit" do
    project = Factory(:project)
    
    get :edit, :id => project.id
    assert_response :success
    assert_not_nil assigns(:project)
  end
  
  test "should update project" do
    project = Factory(:project)
    new_name = project.name + " test"
    
    put :update, {:id => project.id, :project => { :name => new_name } }
    
    assert_equal assigns(:project).name, new_name
    assert_equal assigns(:project).id, project.id
    assert_redirected_to project_path(assigns(:project))
  end
  
  test "should delete project" do
    project = Project.create(:name => 'Projekt 3')
    
    assert_difference('Project.count', -1) do
      delete :destroy, :id => project.id
    end
    
    assert_redirected_to projects_path
  end
end
