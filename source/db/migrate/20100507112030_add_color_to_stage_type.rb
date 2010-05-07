class AddColorToStageType < ActiveRecord::Migration
  def self.up
    add_column :stage_types, :color, :string
  end

  def self.down
    remove_column :stage_types, :color
  end
end
