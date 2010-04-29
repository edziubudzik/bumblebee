class StageTypesController < ApplicationController
  resource_controller
  
  create.wants.js { redirect_to stage_types_path }
end