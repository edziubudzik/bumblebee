class StageType < ActiveRecord::Base
  has_many :stages
  
  has_and_belongs_to_many :block_types
  has_many :block_type_stage_types
end
