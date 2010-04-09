class AddUserIdToDemoActivity < ActiveRecord::Migration
  def self.up
    add_column :demo_activities, :user_id, :integer
  end

  def self.down
    remove_column :demo_activities, :user_id
  end
end
