class InsertDefaultStageTypes < ActiveRecord::Migration
  def self.up
    StageType.create :name => 'analiza'
    StageType.create :name => 'projektowanie'
    StageType.create :name => 'implementacja'
    StageType.create :name => 'testowanie'
    StageType.create :name => 'support'
  end

  def self.down
  end
end
