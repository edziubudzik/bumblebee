class PagesController < ApplicationController
  load_and_authorize_resource
  resource_controller
  
  belongs_to :project
  
  show.before do
    @page.revert_to(params[:version].to_i) if params[:version]
  end
end
