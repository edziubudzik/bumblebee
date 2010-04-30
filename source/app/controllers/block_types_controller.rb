class BlockTypesController < ApplicationController
  resource_controller

  before_filter :find_stage_types
  before_filter :ensure_no_stage_type, :only => :update

  create.wants.js { redirect_to block_types_path }

  private
  def find_stage_types
    @stage_types = StageType.find :all
  end

  def ensure_no_stage_type
    params[:block_type][:stage_type_ids] ||= []
  end

end