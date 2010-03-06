class RemoveTypeFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :type
  end

  def self.down
    add_column :events, :type, :integer
  end
end
