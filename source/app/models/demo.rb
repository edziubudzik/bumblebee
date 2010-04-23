class Demo < ActiveRecord::Base
  has_one :event, :as => :eventable
  belongs_to :project
  has_many :demo_activities, :include => :user
  has_many :bug_reports, :include => :user
  
  validates_presence_of :name, :description, :url
  validates_length_of :name, :url, :maximum => 255
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  def all_activities
    (demo_activities + bug_reports).sort_by { |a| a.created_at }
  end
end
