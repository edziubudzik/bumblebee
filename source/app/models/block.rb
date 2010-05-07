class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :block_type
  
  has_many :stages, :through => :block_stages
  has_many :block_stages
  
  accepts_nested_attributes_for :block_stages
  
  def cost
    block_stages.sum :cost
  end
end
