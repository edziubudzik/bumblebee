class DemosController < ApplicationController
  resource_controller
  belongs_to :project
  
  show.wants.xml { render :xml => @demo }
  
  def browse
    @demo = object
    
    respond_to do |format|
      format.html { render :action => :browse }
    end
  end
end
