class CreateDemoActivities < ActiveRecord::Migration
  def self.up
    create_table :demo_activities do |t|
      t.integer :demo_id
      t.string :url
      t.string :method

      t.timestamps
    end
  end

  def self.down
    drop_table :demo_activities
  end
end
