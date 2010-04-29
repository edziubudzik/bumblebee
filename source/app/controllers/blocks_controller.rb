class BlocksController < ApplicationController
  #resource_controller
  #belongs_to :project

  before_filter :find_project

  def new
    @block = Block.new

  end

  def create
    @block = Block.new
    #@block.project_id = params[:project_id]

  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end
end
