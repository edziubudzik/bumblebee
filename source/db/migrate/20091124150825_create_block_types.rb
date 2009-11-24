class CreateBlockTypes < ActiveRecord::Migration
  def self.up
    create_table :block_types do |t|
      t.string :name
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :block_types
  end
end
