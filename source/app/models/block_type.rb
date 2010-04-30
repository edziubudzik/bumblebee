class BlockType < ActiveRecord::Base
  has_many :blocks
  
  has_many :stage_types, :through => :block_type_stage_types
  has_many :block_type_stage_types

end
