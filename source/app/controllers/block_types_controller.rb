class BlockTypesController < ApplicationController
  resource_controller

  before_filter :create_empty_arrays
  before_filter :ensure_no_stage_type, :only => :update

  create.wants.js { redirect_to block_types_path }



  show.before do
    (BlockTypeStageType.find_all_by_block_type_id @block_type.id).each do |btst|
      @stage_types.push(StageType.find(btst.stage_type_id))
      @stage_types_costs[btst.stage_type_id] = btst.cost
    end
  end

  create.after do
    (BlockTypeStageType.find_all_by_block_type_id @block_type.id).each do |btst|
      BlockTypeStageType.update(btst.id, {:cost => params[:stage_types_costs][btst.stage_type_id.to_s]})
    end
  end

  edit.before do
    (BlockTypeStageType.find_all_by_block_type_id @block_type.id).each do |btst|
      @stage_types_costs[btst.stage_type_id] = btst.cost
    end
  end
  
  update.after do
    (BlockTypeStageType.find_all_by_block_type_id @block_type.id).each do |btst|
      BlockTypeStageType.update(btst.id, {:cost => params[:stage_types_costs][btst.stage_type_id.to_s]})
    end
  end

  destroy.after do
    (BlockTypeStageType.find_all_by_block_type_id @block_type.id).each do |btst|
      btst.destroy
    end
  end



  private

  def create_empty_arrays
    @stage_types = []
    @stage_types_costs = []
  end

  def ensure_no_stage_type
    params[:block_type][:stage_type_ids] ||= []
  end

end