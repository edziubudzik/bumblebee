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

#  update.after do
#    add_new_stages
#    destroy_not_needed_stages
#    add_new_blocks
#    destroy_not_needed_blocks
#  end

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

#  def add_new_stages
#    params[:stage_type_ids].each do |stage_type_id|
#      @stage = Stage.new
#      @stage.stage_type_id = stage_type_id
#      @stage.project_id = @project.id
#      @stage.save
#    end
#  end
#
#  def destroy_not_needed_stages
#    # TODO: Jesli istnieja klocki posiadajace dany etap, to nie powinno sie usuwac tego etapu
#    @old_stages.each do |old_stage|
#      if ( !params[:stages_ids] || !params[:stages_ids].include?(old_stage.id.to_s) )
#        old_stage.destroy
#      end
#    end
#  end
#
#  def add_new_blocks
#    params[:block_type_ids].each do |block_type_id|
#      @block = Block.new
#      @block.block_type_id = block_type_id
#      @block.project_id = @project.id
#      @block.save
#      add_new_stages_if_needed_after_adding_new_block(block_type_id)
#      add_block_stages_relations(@block)
#    end
#  end
#
#  def destroy_not_needed_blocks
#    # TODO Usun relacje block_stages
#    @old_blocks.each do |old_block|
#      if ( !params[:blocks_ids] || !params[:blocks_ids].include?(old_block.id.to_s) )
#        old_block.destroy
#      end
#    end
#  end
#
#
#  def add_new_stages_if_needed_after_adding_new_block(block_type_id)
#    # TODO
#  end
#
#  def add_block_stages_relations(block)
#    # TODO
##    (BlockTypeStageType.find_all_by_block_type_id block.block_type_id).each do |btst|
##      @stage = Stage.find_all_by_stage_type_id_and_project_id btst.stage_type_id, @project.id
##      puts "MGMT  " + @stage.id.to_s
##    end
##      block.id
##      stage_id
##      btst.cost
#  end

end