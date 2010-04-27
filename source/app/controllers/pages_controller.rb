class PagesController < ApplicationController
  load_and_authorize_resource
  resource_controller
  
  belongs_to :project
  
  create.before do
    params[:page][:user_id] = current_user.id
  end
  
  update.before do
    params[:page][:user_id] = current_user.id
  end
  
  show.before do
    @page.revert_to(params[:version].to_i) if params[:version]
  end
end
