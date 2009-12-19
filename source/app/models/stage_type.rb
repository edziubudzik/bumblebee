class StageType < ActiveRecord::Base
  before_create :set_position
  
  has_many :stages
  
  has_and_belongs_to_many :block_types
  has_many :block_type_stage_types
  
  def set_position
    self.position = StageType.count + 1
  end
end
