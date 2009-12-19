require 'test_helper'

class BlocksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :project_id => project.id
    assert_response :success
    assert_not_nil assigns(:blocks)
  end
  
  # test "should get show" do
  #   block = Block.create(:name => 'Klocek 1')
  #   
  #   get :show, :project_id => project.id, :id => block.id
  #   assert_response :success
  #   assert_not_nil assigns(:block)
  # end
  
  test "should get new" do
    get :new, :project_id => project.id
    assert_response :success
    assert_not_nil assigns(:block)
  end
  
  test "should create block with existing block type" do
    name = "Testowy klocek"
    block_type = BlockType.create :name => name
    
    assert_difference('Block.count') do
      post :create, :project_id => project.id, :block => { :block_type_id => block_type.id }
    end
    
    assert_equal assigns(:block).project_id, project.id
    assert_equal assigns(:block).block_type_id, block_type.id
    assert_redirected_to project_block_path(assigns(:project), assigns(:block))
  end
  
  # test "should get edit" do
  #   block = Block.create(:name => 'Projekt 1')
  #   
  #   get :edit, :project_id => project.id, :id => block.id
  #   assert_response :success
  #   assert_not_nil assigns(:block)
  # end
  
  # test "should update block" do
  #   new_name = 'block 2'
  #   block = Block.create(:name => 'Projekt 1')
  #   
  #   put :update, :project_id => project.id, :id => block.id, :block => { :name => new_name }
  #   
  #   assert_equal assigns(:block).name, new_name
  #   assert_equal assigns(:block).id, block.id
  #   assert_redirected_to block_path(assigns(:block))
  # end
  
  # test "should delete block" do
  #   block = Block.create(:name => 'Projekt 3')
  #   
  #   assert_difference('Block.count', -1) do
  #     delete :destroy, :project_id => project.id, :id => block.id
  #   end
  #   
  #   assert_redirected_to blocks_path
  # end
  
  def project
    @project ||= Project.create :name => 'Projekt wydmuszka'
  end
end
