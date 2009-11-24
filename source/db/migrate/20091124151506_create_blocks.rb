class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.integer :block_type_id
      t.integer :project_id
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
