require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  # Wyświetlanie listy projektów
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end
  
  test "should get show" do
    project = Project.create(:name => 'Projekt 1')
    
    get :show, :id => project.id
    assert_response :success
    assert_not_nil assigns(:project)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:project)
  end
  
  test "should create project" do
    name = 'Testowy projekt'
    assert_difference('Project.count') do
      post :create, :project => { :name => name }
    end
    
    assert_equal assigns(:project).name, name
    assert_redirected_to project_path(assigns(:project))
  end
  
  test "should not create project" do
    assert_no_difference('Project.count') do
      post :create, :post => { :name => '' }
    end
    
    assert_no_difference('Project.count') do
      post :create, :post => { :name => 'Za długa nazwa projektu. 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111 1111111111' }
    end
    
    assert_template "new"
  end
end
