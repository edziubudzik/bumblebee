class BlockTypesController < ApplicationController
  layout nil
  resource_controller
  
  create.wants.js { redirect_to block_types_path }
end
