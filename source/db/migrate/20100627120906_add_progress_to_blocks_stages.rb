class AddProgressToBlocksStages < ActiveRecord::Migration
  def self.up
		add_column :blocks_stages, :progress, :integer
  end

  def self.down
		remove_column :blocks_stages, :progress
  end
end
