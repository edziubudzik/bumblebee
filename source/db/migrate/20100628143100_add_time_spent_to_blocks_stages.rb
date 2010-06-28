class AddTimeSpentToBlocksStages < ActiveRecord::Migration
  def self.up
    add_column :blocks_stages, :time_spent, :integer
  end

  def self.down
    remove_column :blocks_stages, :time_spent
  end
end