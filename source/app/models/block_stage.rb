class BlockStage < ActiveRecord::Base

  set_table_name "blocks_stages"
  belongs_to :stage
  belongs_to :block

  def block_cost_participation
    (cost.to_f/block.cost.to_f*100).round
  end
  
end
