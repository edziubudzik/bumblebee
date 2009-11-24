class CreateStageTypes < ActiveRecord::Migration
  def self.up
    create_table :stage_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :stage_types
  end
end
