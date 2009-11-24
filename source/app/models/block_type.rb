class BlockType < ActiveRecord::Base
  has_many :blocks
  
  has_and_belongs_to_many :stage_types
  has_many :block_type_stage_types
end
