class CreateBlockTypeStageTypes < ActiveRecord::Migration
  def self.up
    create_table :block_type_stage_types do |t|
      t.integer :block_type_id
      t.integer :stage_type_id
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :block_type_stage_types
  end
end
