class BlockStage < ActiveRecord::Base

  set_table_name "blocks_stages"
  belongs_to :stage
  belongs_to :block

end
