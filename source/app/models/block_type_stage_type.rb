class BlockTypeStageType < ActiveRecord::Base
  belongs_to :block_type
  belongs_to :stage_type
  set_table_name "block_types_stage_types"
end
