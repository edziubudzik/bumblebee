class Project < ActiveRecord::Base
  has_many :blocks, :after_add => :update_stages
  has_many :stages
  has_many :stage_types, :through => :stages
  
  has_many :demos, :order => "created_at desc"
  
  has_many :pages
  
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
  
  def page_versions
    (pages.collect { |p| p.versions }).flatten
  end
  
  def all_activities
    ((pages + page_versions + demos + blocks).sort_by { |a| a.created_at }).reverse
  end

  private

  def update_stages(block)
    for stage_type in block.block_type.stage_types
      if stage_type_ids.include?(stage_type.id)
        stage = (stages.select { |s| s.stage_type_id == stage_type.id }).first
      else
        stage = stages.create :stage_type_id => stage_type.id
      end
			btst = block.block_type.block_type_stage_types.find :first, :conditions => {:stage_type_id => stage_type.id}
			block_stage = BlockStage.new :cost => btst.cost
			block_stage.stage = stage
			block.block_stages << block_stage
    end
  end
  
end