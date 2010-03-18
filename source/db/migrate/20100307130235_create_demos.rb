class CreateDemos < ActiveRecord::Migration
  def self.up
    create_table :demos do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :demos
  end
end
