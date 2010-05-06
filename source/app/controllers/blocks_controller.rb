class BlocksController < ApplicationController
  resource_controller
  belongs_to :project
  
  create.success.wants.html { render :partial => "blocks/blocks", :locals => { :blocks => @project.blocks } }
  
  destroy.wants.html { redirect_to project_blocks_path(@project) }
end
