class BugReportsController < ApplicationController
  protect_from_forgery :except => :create
  
  resource_controller
  belongs_to :demo
  
  show.wants.xml { render :xml => @bug_report }
  show.wants.html { render :text => "" }
  
  index.wants.js { render :json => @bug_reports, :callback => 'Bumblebee.DemoBrowser.loadBugReports' }
  
  create.wants.html { redirect_to project_demo_bug_report_url(:project_id => @demo.project.id, :demo_id => @demo.id, :id => @bug_report)}
  
  create.after do
    object.user = current_user
    object.save
  end
  
  protected
    def collection
      unless params[:url].nil?
        @demo.bug_reports.find(:all, :conditions => ['url=?', params[:url]])
      else  
        @demo.bug_reports.find(:all)
      end
    end
end
