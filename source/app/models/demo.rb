class Demo < ActiveRecord::Base
  has_one :event, :as => :eventable
  belongs_to :project
  has_many :demo_activities, :include => :user, :order => 'created_at desc'
  has_many :bug_reports, :include => :user, :order => 'bug_reports.created_at desc'
  
  validates_presence_of :name, :description, :url
  validates_length_of :name, :url, :maximum => 255
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  after_save :update_event
  
  def all_activities
    ((demo_activities + bug_reports).sort_by { |a| a.created_at }).reverse
  end
  
  private
  
    def update_event
      if event
        event.time = created_at
        event.save
      else
        create_event(:time => created_at)
      end
    end
end
