class Demo < ActiveRecord::Base
  has_one :event, :as => :eventable
  belongs_to :project
  has_many :demo_activities
  has_many :bug_reports
  
  validates_presence_of :name, :description, :url
  validates_length_of :name, :url, :maximum => 255
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
