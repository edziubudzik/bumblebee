class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :block_type
  
  has_many :stages, :through => :block_stages
  has_many :block_stages
end
