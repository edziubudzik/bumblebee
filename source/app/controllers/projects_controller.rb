class ProjectsController < ApplicationController
  resource_controller
  
  def events
    @project = object
    
    respond_to do |format|
      format.xml { render :xml => @project.events }
    end
  end
end
