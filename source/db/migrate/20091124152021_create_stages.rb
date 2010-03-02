class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.integer :stage_type_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
