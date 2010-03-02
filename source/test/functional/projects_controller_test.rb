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
  
  test "should get edit" do
    project = Project.create(:name => 'Projekt 1')
    
    get :edit, :id => project.id
    assert_response :success
    assert_not_nil assigns(:project)
  end
  
  test "should update project" do
    new_name = 'Project 2'
    project = Project.create(:name => 'Projekt 1')
    
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
