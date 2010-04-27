class PagesController < ApplicationController
  load_and_authorize_resource
  resource_controller
  
  belongs_to :project
end
