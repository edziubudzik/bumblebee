class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :block_type
  
  has_and_belongs_to_many :stages
  has_many :block_stages
end
