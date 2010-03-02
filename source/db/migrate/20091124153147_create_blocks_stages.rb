class CreateBlocksStages < ActiveRecord::Migration
  def self.up
    create_table :blocks_stages do |t|
      t.integer :block_id
      t.integer :stage_id
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :blocks_stages
  end
end
