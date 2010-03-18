class Project < ActiveRecord::Base
  has_many :blocks
  has_many :stages
  
  has_many :demos
  
  has_many :events, :finder_sql => 'SELECT * FROM events WHERE id IN (#{self.event_ids_for_finder_sql}) ORDER BY time ASC'
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  def event_ids_for_finder_sql
    event_ids = [ ]
    event_ids<<stages.collect { |s| s.event_ids }
    event_ids<<demos.collect { |d| d.event.id }
    event_ids.flatten!
  
    event_ids.empty? ? "0" : event_ids.join(',')  
  end
end
