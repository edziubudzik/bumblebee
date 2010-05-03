class BlocksController < ApplicationController
  resource_controller
  belongs_to :project

  before_filter :find_project
  before_filter :find_block_type

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_block_type
    @block = Block.find(params[:id])
    @block_type = BlockType.find(@block.block_type_id)
  end

end
