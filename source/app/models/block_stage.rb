class BlockStage < ActiveRecord::Base

  set_table_name "blocks_stages"
  belongs_to :stage
  belongs_to :block

  def block_cost_participation
    if block.cost > 0
      (cost.to_f/block.cost.to_f*100).round
    else
      0
    end
  end
  
end
