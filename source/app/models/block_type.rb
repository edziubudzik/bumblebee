class BlockType < ActiveRecord::Base
  has_many :blocks
  
  has_and_belongs_to_many :stage_types
  has_many :block_type_stage_types

  @stage_types
  # :with_stage_type#, lambda { |stage_type| {:conditions => "stage_types_mask & #{2**STAGE_TYPES.index(stage_type.to_s)} > 0"} }

  def stage_types=(stage_types)
    @stage_types = stage_types
  end

  def has_stage_type?(stage_type)
    return true # temp
  end

end
