class ProjectsController < ApplicationController
  resource_controller

  before_filter :ensure_no_stage, :only => :update
  before_filter :ensure_no_stage_type, :only => :update
  before_filter :ensure_no_block_type, :only => :update

  create.success.wants.html do
    redirect_to project_blocks_path(@project)
  end

  edit.before do
    @stages = Stage.find_all_by_project_id @project.id
    @blocks = Block.find_all_by_project_id @project.id
  end

  update.before do
    @old_stages = Stage.find_all_by_project_id @project.id
    @old_blocks = Block.find_all_by_project_id @project.id
  end

#  destroy.after do
#    (Stage.find_all_by_project_id @project.id).each do |stage|
#      stage.destroy
#    end
#    (Block.find_all_by_project_id @project.id).each do |block|
#      block.destroy
#    end
#  end

  def events
    @project = object
    
    respond_to do |format|
      format.xml { render :xml => @project.events }
    end
  end



  private

  def ensure_no_stage
    params[:stages_ids] ||= []
  end

  def ensure_no_stage_type
    params[:stage_type_ids] ||= []
  end

  def ensure_no_block_type
    params[:block_type_ids] ||= []
  end

end