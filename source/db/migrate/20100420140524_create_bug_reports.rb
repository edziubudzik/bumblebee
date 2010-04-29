class CreateBugReports < ActiveRecord::Migration
  def self.up
    create_table :bug_reports do |t|
      t.integer :demo_id
      t.integer :user_id
      t.integer :x
      t.integer :y
      t.string :url
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :bug_reports
  end
end
