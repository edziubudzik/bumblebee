class DemoActivitiesController < ApplicationController
  protect_from_forgery :except => :create
  
  resource_controller
  belongs_to :demo
  
  show.wants.xml { render :xml => @demo_activity }
  show.wants.html { render :text => "" }
  
  create.wants.html { redirect_to project_demo_demo_activity_url(:project_id => @demo.project.id, :demo_id => @demo.id, :id => @demo_activity)}
  
  # create.wants.html { render nil }
end
