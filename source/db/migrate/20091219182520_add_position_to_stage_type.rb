class AddPositionToStageType < ActiveRecord::Migration
  def self.up
    add_column :stage_types, :position, :integer
  end

  def self.down
    remove_column :stage_types, :position
  end
end
