class AddStartDateAndHumanResourcesToProjects < ActiveRecord::Migration
  def self.up
		add_column :projects, :start_date, :date
		add_column :projects, :human_resources, :integer
  end

  def self.down
		remove_column :projects, :start_date
		remove_column :projects, :human_resources
  end
end