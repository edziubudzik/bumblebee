class DemoActivitiesController < ApplicationController
  resource_controller
  belongs_to :demo
  
  show.wants.xml { render :xml => @demo_activity }
end
